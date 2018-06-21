#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

#define uint10_t ap_uint<10>
#define uint9_t ap_uint<9>
#define uint3_t ap_uint<3>

using namespace std;

bool getClusterTrackLinker(uint16_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t trackPT[MaxTracks],
			   uint16_t trackEta[MaxTracks],
			   uint16_t trackPhi[MaxTracks],
			   uint16_t linkedTrackPT[MaxTracks],
			   uint16_t linkedTrackEta[MaxTracks],
			   uint16_t linkedTrackPhi[MaxTracks],
			   //float linkedTrackQuality[MaxTracks],
			   uint16_t neutralClusterET[MaxNeutralClusters],
			   uint16_t neutralClusterEta[MaxNeutralClusters],
			   uint16_t neutralClusterPhi[MaxNeutralClusters])
			  {

#pragma HLS PIPELINE II=6
//#pragma HLS INTERFACE ap_none port=output
#pragma HLS ARRAY_PARTITION variable=clusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackPhi complete dim=0
//#pragma HLS ARRAY_PARTITION variable=linkedTrackQuality complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterPhi complete dim=0

  uint16_t clusterEta[MaxNeutralClusters];
  uint16_t clusterPhi[MaxNeutralClusters];
#pragma HLS ARRAY_PARTITION variable=clusterEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=clusterPhi complete dim=0
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
#pragma HLS UNROLL
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
#pragma HLS UNROLL
      int cluster = tEta * NCaloLayer1Phi + tPhi;
      // Convert cruder calorimeter position to track LSB
      // This can be a LUT - perhaps HLS will take care of this efficiently
      clusterEta[cluster] = (tEta * NCrystalsPerEtaPhi) + peakEta[tEta][tPhi];
      clusterPhi[cluster] = (tPhi * NCrystalsPerEtaPhi) + peakPhi[tEta][tPhi];
      //cout << "peaketaphi" << peakEta[tEta][tPhi] << "\t" << peakPhi[tEta][tPhi] << endl;
      //cout <<"I_from_func" << clusterET[tEta][tPhi] << "\t" << clusterEta[cluster] << "\t" << clusterPhi[cluster] << endl;

      // Initialize neutral clusters
      neutralClusterET[cluster] = clusterET[tEta][tPhi];
      neutralClusterEta[cluster] = clusterEta[cluster];
      neutralClusterPhi[cluster] = clusterPhi[cluster];

     // cout <<"II_from_func" << neutralClusterET[cluster] << "\t" <<neutralClusterEta[cluster] << "\t" << neutralClusterPhi[cluster] << endl;
      //cout <<"III_from_func" << clusterET[tEta][tPhi] << "\t" << clusterEta[cluster] << "\t" << clusterPhi[cluster] << endl;
    }
  }

	uint16_t track_peak_eta[MaxTracks];
	uint16_t track_peak_phi[MaxTracks];
#pragma HLS ARRAY_PARTITION variable=track_peak_eta dim=0
#pragma HLS ARRAY_PARTITION variable=track_peak_phi dim=0

	cout<<"Max_track"<<MaxTrackEta<<endl;
	cout<<"track_eta" << conv_track_eta<< endl;
	cout<<"track_phi" << conv_track_phi<< endl;
	cout<<"clus_eta"<<conv_cluster_eta<<endl;
	cout<<"clus_phi"<<conv_cluster_phi<<endl;

  // Double loop over tracks and clusters for linking
  for(int track = 0; track < MaxTracks; track++) {
#pragma HLS UNROLL

	  linkedTrackPT[track] = trackPT[track];
	  linkedTrackEta[track] = trackEta[track];
	  linkedTrackPhi[track] = trackPhi[track];
	  //linkedTrackQuality[track] = ap_fixed<8,6>(0);


	  track_peak_eta[track] = trackEta[track] * conv_track_eta;
	  track_peak_phi[track] = trackPhi[track] * conv_track_phi;

	  cout<<"track_peak_e"<< trackEta[track] << endl;
	  cout<<"track_peak_p"<< trackPhi[track] << endl;


	  uint16_t clus_eta = track_peak_eta[track] / NCaloLayer1Phi;
	  uint16_t clus_phi = track_peak_phi[track] % NCaloLayer1Phi;

	  ap_fixed<10,2> diff[3][3];
	  for(int a = 0; a < 3; a++){
		  for (int b = 0; b<3; b++){
			  diff[a][b] = 0;
		  }
	  }
	  //First check in the same tower as track
	  uint16_t eta = clus_eta;
	  uint16_t phi = clus_phi;
	  uint16_t cluster_trial = (eta * NCaloLayer1Phi) + phi;

	  cout<< "eta" << eta << "Phi" << phi << endl;
	  cout << "clus_trial"<< cluster_trial << endl;
		if(clusterET[eta][phi] == 0) break; //If no cluster ET, break

		uint16_t diffEta = clusterEta[cluster_trial] - track_peak_eta[track];
		if(diffEta >= MaxTrackEta) diffEta = track_peak_eta[track] - clusterEta[cluster_trial];
		uint16_t diffPhi = clusterPhi[cluster_trial] - track_peak_phi[track];
		if(diffPhi >= MaxTrackPhi) diffPhi = track_peak_phi[track] - clusterPhi[cluster_trial];

		//If this is the best match,break:
		if(diffEta <= 1 && diffPhi<= 1)
		{
			//This is the best match, so link them
			linkedTrackEta[track] = clusterEta[cluster_trial];
			linkedTrackPhi[track] = clusterPhi[cluster_trial];
			//making neutral cluster
			neutralClusterET[cluster_trial] -= trackPT[track];
			break;
		}

		//If not, we run for all the other 8 towers in a 3*3 matrix around the track-tower level

		ap_ufixed<10,2> least_dist = 100; //random big value initialization
	  for (int i = -1; i < 2; i++){
#pragma HLS UNROLL
		  for (int j = -1; j < 2; j++){
#pragma HLS UNROLL
			  if(i==0 && j==0) break;


				uint16_t eta = clus_eta + i;
				uint16_t phi = clus_phi + j;
				//to find out the tower coordinate in the 1D cluster array
				uint16_t cluster_trial = (eta * NCaloLayer1Phi) + phi;
				if(cluster_trial < 0 || cluster_trial > 67) break;

				uint16_t diffEta = clusterEta[cluster_trial] - track_peak_eta[track];
				if(diffEta >= MaxTrackEta) diffEta = track_peak_eta[track] - clusterEta[cluster_trial];
				uint16_t diffPhi = clusterPhi[cluster_trial] - track_peak_phi[track];
				if(diffPhi >= MaxTrackPhi) diffPhi = track_peak_phi[track] - clusterPhi[cluster_trial];
				uint16_t common, uncommon;
				if(diffEta >= diffPhi) {

					uncommon = diffEta - diffPhi;
					common = diffEta - uncommon;
					}

				else {
					uncommon = diffPhi - diffEta;
					common = diffPhi - uncommon;
				}

				//uint16_t temp = (common>>1) + common;
				//diff[i][j] = ap_ufixed<10,2>(temp + uncommon);
				//diff[i][j] = ap_ufixed<8,6>(1.4*common + uncommon);
				if(diff[i][j] < least_dist) {
					least_dist =  diff[i][j];
					//This is the best match, so link them
					linkedTrackEta[track] = clusterEta[cluster_trial];
					linkedTrackPhi[track] = clusterPhi[cluster_trial];
					//making neutral cluster
					neutralClusterET[cluster_trial] -= trackPT[track];
					//linkedTrackQuality[track] = least_dist;
				}

		  	}

	  }


  }

	  return true;
}
