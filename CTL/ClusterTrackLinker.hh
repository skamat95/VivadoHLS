#ifndef ClusterTrackLinker_hh
#define ClusterTrackLinker_hh

#include "ClusterFinder.hh"
#include "ap_int.h"

#define uint10_t ap_uint<10>
#define uint9_t ap_uint<9>

const uint16_t MaxTracks = 60;
const uint16_t MaxClusters = 60;


// Track PT is specified in 16-bits
const uint16_t MaxTrackPT = 0xFFFF;
// Barrel calorimeter eta limit is 1.479 and is measured with LSB = 0.0005 - making it up :)
// Temporarily deal with only positive eta - in principle MaxTrackEta should be double this!
const uint16_t MaxTrackEta = int(1.479 / 0.0005);
// Barrel calorimeter eta phi coverage is measured with LSB = 0.0001 - making it up :)
const uint16_t MaxTrackPhi = int(2. * 3.1415927 / 0.0001);

const uint16_t MaxTracksInCard = 60;
const uint16_t MaxNeutralClusters = NCaloLayer1Eta * NCaloLayer1Phi;



bool getClusterTrackLinker(uint10_t clusterET[MaxClusters],
		   uint9_t peakEta[MaxClusters],
		   uint10_t peakPhi[MaxClusters],
		   uint10_t trackPT[MaxTracks],
		   uint9_t trackEta[MaxTracks],
		   uint10_t trackPhi[MaxTracks],
		   uint10_t linkedTrackPT[MaxTracks],
		   uint9_t linkedTrackEta[MaxTracks],
		   uint9_t linkedTrackPhi[MaxTracks],
		   uint16_t linkedTrackQuality[MaxTracks],
		   uint10_t neutralClusterET[MaxNeutralClusters],
		   uint16_t neutralClusterEta[MaxNeutralClusters],
		   uint9_t neutralClusterPhi[MaxNeutralClusters]);

#endif
