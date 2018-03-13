#include "ClusterFinder.hh"
#include "ClusterTrackLinker.hh"

bool getClusterTrackLinker(uint10_t clusterET[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakEta[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint16_t peakPhi[NCaloLayer1Eta][NCaloLayer1Phi],
			   uint10_t trackPT[MaxTracks],
			   uint9_t trackEta[MaxTracks],
			   uint10_t trackPhi[MaxTracks],
			   uint10_t linkedTrackPT[MaxTracks],
			   uint9_t linkedTrackEta[MaxTracks],
			   uint10_t linkedTrackPhi[MaxTracks],
			   uint16_t linkedTrackQuality[MaxTracks],
			   uint10_t neutralClusterET[MaxNeutralClusters],
			   uint9_t neutralClusterEta[MaxNeutralClusters],
			   uint10_t neutralClusterPhi[MaxNeutralClusters]) {

#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=clusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=peakPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=trackPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackPT complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=linkedTrackQuality complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterET complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterEta complete dim=0
#pragma HLS ARRAY_PARTITION variable=neutralClusterPhi complete dim=0


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
      clusterEta[cluster] = (tEta * NCrystalsPerEtaPhi + peakEta[tEta][tPhi]) * conv_cluster_eta;
      clusterPhi[cluster] = (tPhi * NCrystalsPerEtaPhi + peakPhi[tEta][tPhi]) * conv_cluster_eta;
      // Initialize neutral clusters
      neutralClusterET[cluster] = clusterET[tEta][tPhi];
      neutralClusterEta[cluster] = clusterEta[cluster];
      neutralClusterPhi[cluster] = clusterPhi[cluster];
    }
  }

	uint16_t track_peak_eta[MaxTracks];
	uint16_t track_peak_phi[MaxTracks];
#pragma HLS ARRAY_PARTITION variable=track_peak_eta dim=0
#pragma HLS ARRAY_PARTITION variable=track_peak_phi dim=0


  // Double loop over tracks and clusters for linking
  for(int track = 0; track < MaxTracksInCard; track++) {
#pragma HLS UNROLL

    linkedTrackPT[track] = trackPT[track];
    linkedTrackEta[track] = trackEta[track];
    linkedTrackPhi[track] = trackPhi[track];
    linkedTrackQuality[track] = 0;

	  track_peak_eta[track] = int(trackEta[track] * conv_track_eta);
	  track_peak_phi[track] = int(trackPhi[track] * conv_track_phi);
    uint8_t nMatches = 0;
    for(int cluster = 0; cluster < MaxNeutralClusters; cluster++) {
#pragma HLS UNROLL
    	uint16_t clus_eta = clusterEta[cluster] / NCaloLayer1Phi;
    	uint16_t clus_phi = clusterPhi[cluster] % NCaloLayer1Phi;
    	uint16_t eta_diff = track_peak_eta[track] - clus_eta; //maybe take modulus
    	uint16_t phi_diff = track_peak_phi[track] - clus_phi;
    	if(!(eta_diff <= 2) && (phi_diff <= 2)) break;
      uint16_t diffEta = clusterEta[cluster] - trackEta[track];
      if(diffEta >= MaxTrackEta) diffEta = trackEta[track] - clusterEta[cluster];
      uint16_t diffPhi = clusterPhi[cluster] - trackPhi[track];
      if(diffPhi >= MaxTrackPhi) diffPhi = trackPhi[track] - clusterPhi[cluster];
      if(diffEta <= 1 && diffPhi <= 2) {
        nMatches++;
        linkedTrackQuality[track] |= 0x0001;
        if(diffEta <= 1 && diffPhi <= 1) {
          linkedTrackQuality[track] |= 0x0002;
        }
        if(diffEta == 0 && diffPhi == 0) {
          linkedTrackQuality[track] |= 0x0004;
        }
        if(neutralClusterET[cluster] > trackPT[track]) {
          neutralClusterET[cluster] -= trackPT[track];
          linkedTrackQuality[track] |= 0x0010;
          // To do: Adjust eta, phi somehow
        }
        else {
          linkedTrackQuality[track] |= 0x0020;
          neutralClusterET[cluster] = 0;
        }
      }
    }
    linkedTrackQuality[track] |= (nMatches << 8);
  }
  return true;
}
