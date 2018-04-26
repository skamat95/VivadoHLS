#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

#define uint10_t ap_uint<10>
#define uint9_t ap_uint<9>
#define uint3_t ap_uint<3>



bool getClusterTrackLinker(uint16_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t trackPT[MaxTracks],
			   uint16_t trackEta[MaxTracks],
			   uint16_t trackPhi[MaxTracks],
			   algo_out &output)
			  {

#pragma HLS PIPELINE II=6
#pragma HLS INTERFACE ap_none port=output
#pragma HLS ARRAY_PARTITION variable=clusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.linkedTrackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.linkedTrackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.linkedTrackPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.linkedTrackQuality complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.neutralClusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.neutralClusterEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=output.neutralClusterPhi complete dim=0

  uint9_t clusterEta[MaxNeutralClusters];
  uint10_t clusterPhi[MaxNeutralClusters];
#pragma HLS ARRAY_PARTITION variable=clusterEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=clusterPhi complete dim=0
  for(int tEta = 0; tEta < NCaloLayer1Eta; tEta++) {
#pragma HLS UNROLL
    for(int tPhi = 0; tPhi < NCaloLayer1Phi; tPhi++) {
#pragma HLS UNROLL
      int cluster = tEta * NCaloLayer1Phi + tPhi;
      // Convert cruder calorimeter position to track LSB
      // This can be a LUT - perhaps HLS will take care of this efficiently
      clusterEta[cluster] = tEta * NCrystalsPerEtaPhi + peakEta[tEta][tPhi];
      clusterPhi[cluster] = tPhi * NCrystalsPerEtaPhi + peakPhi[tEta][tPhi];
      // Initialize neutral clusters
      output.neutralClusterET[cluster] = clusterET[tEta][tPhi];
      output.neutralClusterEta[cluster] = clusterEta[cluster];
      output.neutralClusterPhi[cluster] = clusterPhi[cluster];
    }
  }

	uint16_t track_peak_eta[MaxTracks];
	uint16_t track_peak_phi[MaxTracks];
#pragma HLS ARRAY_PARTITION variable=track_peak_eta dim=0
#pragma HLS ARRAY_PARTITION variable=track_peak_phi dim=0


  // Double loop over tracks and clusters for linking
  for(int track = 0; track < MaxTracks; track++) {
#pragma HLS UNROLL

	  output.linkedTrackPT[track] = trackPT[track];
	  output.linkedTrackEta[track] = trackEta[track];
	  output.linkedTrackPhi[track] = trackPhi[track];
	  output.linkedTrackQuality[track] = 0;

	  track_peak_eta[track] = int(trackEta[track] * conv_track_eta);
	  track_peak_phi[track] = int(trackPhi[track] * conv_track_phi);

	  uint16_t clus_eta = int(track_peak_eta[track] / NCaloLayer1Phi);
	  uint16_t clus_phi = int(track_peak_phi[track] % NCaloLayer1Phi);

	  float diff[3][3] = {0};
	  //First check in the same tower as track
	  int eta = clus_eta;
	  int phi = clus_phi;
	  int cluster_trial = (eta * NCaloLayer1Phi) + phi;

		if(clusterET[eta][phi] == 0) break; //If no cluster ET, break

		uint16_t diffEta = clusterEta[cluster_trial] - track_peak_eta[track];
		if(diffEta >= MaxTrackEta) diffEta = track_peak_eta[track] - clusterEta[cluster_trial];
		uint16_t diffPhi = clusterPhi[cluster_trial] - track_peak_phi[track];
		if(diffPhi >= MaxTrackPhi) diffPhi = track_peak_phi[track] - clusterPhi[cluster_trial];

		//If this is the best match,break:
		if(diffEta <= 1 && diffPhi<= 1)
		{
			//This is the best match, so link them
			output.linkedTrackEta[track] = clusterEta[cluster_trial];
			output.linkedTrackPhi[track] = clusterPhi[cluster_trial];
			//making neutral cluster
			output.neutralClusterET[cluster_trial] -= trackPT[track];
			break;
		}

		//If not, we run for all the other 8 towers in a 3*3 matrix around the track-tower level

		float least_dist = 100; //random big value initialization
	  for (int i = -1; i < 2; i++){
#pragma HLS UNROLL
		  for (int j = -1; j < 2; j++){
#pragma HLS UNROLL
			  if(i==0 && j==0) break;


				int eta = clus_eta + i;
				int phi = clus_phi + j;
				//to find out the tower coordinate in the 1D cluster array
				int cluster_trial = (eta * NCaloLayer1Phi) + phi;
				if(cluster_trial < 0 || cluster_trial > 67) break;

				uint16_t diffEta = clusterEta[cluster_trial] - track_peak_eta[track];
				if(diffEta >= MaxTrackEta) diffEta = track_peak_eta[track] - clusterEta[cluster_trial];
				uint16_t diffPhi = clusterPhi[cluster_trial] - track_peak_phi[track];
				if(diffPhi >= MaxTrackPhi) diffPhi = track_peak_phi[track] - clusterPhi[cluster_trial];
				int common, uncommon;
				if(diffEta >= diffPhi) {

					uncommon = diffEta - diffPhi;
					common = diffEta - uncommon;
					}

				else {
					uncommon = diffPhi - diffEta;
					common = diffPhi - uncommon;
				}

				diff[i][j] = 1.4*common + uncommon;
				if(diff[i][j] < least_dist) {
					least_dist =  diff[i][j];
					//This is the best match, so link them
					output.linkedTrackEta[track] = clusterEta[cluster_trial];
					output.linkedTrackPhi[track] = clusterPhi[cluster_trial];
					//making neutral cluster
					output.neutralClusterET[cluster_trial] -= trackPT[track];
					output.linkedTrackQuality[track] = least_dist;
				}

		  	}
	  }


  }
	  return true;
}
