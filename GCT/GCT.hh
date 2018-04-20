#ifndef GCT_hh
#define GCT_hh

#include "ap_int.h"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>

#include <stdint.h>
const uint16_t NCaloLayer1Cards = 18;
const uint16_t NCaloLayer1Eta = 17;
const uint16_t NCaloLayer1Phi = 4;
const uint16_t NCrystalsPerEtaPhi = 5;

//According to one Layer 2 card
const uint16_t NCaloLayer2Eta = 17; //17*2
const uint16_t NCaloLayer2Phi_in = 28; //6*4
const uint16_t NCaloLayer2Phi_out = 24;

const uint16_t NCaloEtaRegions = 2;
const uint16_t NCaloPhiRegions = 6;
const uint16_t NCaloLayer2Clusters = 12;
const uint16_t NCaloLayer2ClustersPerPhi = 3;

const uint16_t NCaloLayer2ExtraPhi = 2;

int GCT(uint16_t Tower[NCaloLayer2Eta][NCaloLayer2Phi],
		uint10_t ClusterET[NCaloLayer2Clusters][NCaloPhiRegions][NCaloEtaRegions],
		uint7_t Cluster_TowerID[NCaloLayer2Clusters][NCaloPhiRegions][NCaloEtaRegions],
	    uint5_t Cluster_EtaPhi[NCaloLayer2Clusters][NCaloPhiRegions][NCaloEtaRegions],
		uint16_t Tower_Left[NCaloLayer1Eta][NCaloLayer2ExtraPhi],
		uint10_t ClusterET_Left[NCaloLayer2ClustersPerPhi],
		uint7_t Cluster_TowerID_Left[NCaloLayer2ClustersPerPhi],
		uint5_t Cluster_EtaPhi_Left[NCaloLayer2ClustersPerPhi],
		uint16_t Tower_Right[NCaloLayer1Eta][NCaloLayer2ExtraPhi],
		uint10_t ClusterET_Right[NCaloLayer2ClustersPerPhi],
		uint7_t Cluster_TowerID_Right[NCaloLayer2ClustersPerPhi],
		uint5_t Cluster_EtaPhi_Right[NCaloLayer2ClustersPerPhi]);


#endif
