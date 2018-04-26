#ifndef GCT_hh
#define GCT_hh

#include "ap_int.h"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>

#include <stdint.h>
const uint16_t NCaloLayer1Cards = 18;//1/2 eta
const uint16_t NCaloLayer1Eta = 17;//1/2 eta
const uint16_t NCaloLayer1Phi = 4;
const uint16_t NCrystalsPerEtaPhi = 5;

//According to one Layer 2 card
const uint16_t NCaloLayer2Eta = 17; //17*2
const uint16_t NCaloLayer2Phi_in = 28; //6*4 + 2 on either side
const uint16_t NCaloLayer2Phi_out = 24; //6*4 as output per card

const uint16_t NCaloEtaDirections = 2;
const uint16_t NCaloPhiRegionsPerCard = 6;
const uint16_t NCaloLayer2ClustersPerCard = 12;
const uint16_t NCaloLayer2ClustersPerPhi = 3;

const uint16_t NCaloLayer2ExtraPhi = 2;

int GCT(uint16_t Tower_in[NCaloLayer2Eta][NCaloLayer2Phi_in],
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint16_t Tower_out[NCaloLayer2Eta][NCaloLayer2Phi_out],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out]);

bool stitch_on_left(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out]);

bool stitch_on_right(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out]);



#endif
