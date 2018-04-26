#include "GCT.hh"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>



int GCT(uint16_t Tower[NCaloLayer2Eta][NCaloLayer2Phi_in],
		uint10_t ClusterET[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in])
{
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID dim=1
#pragma HLS ARRAY_PARTITION variable=ClusterET dim=1
#pragma HLS ARRAY_PARTITION variable=Tower dim=1


	uint16_t tower_num = 0;
	uint16_t crystal_num = 0;

	bool success[3][28] = false; //to keep a track of all clusters successful mergers or not

	//For all clusters check if they are on the boundary
	for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
		for(int j = 0; j < NCaloLayer2ClustersPerPhi; j++){

		if((Cluster_TowerID[j][i]%4) == 0){
			//First boundary in tower
			tower_num = Cluster_TowerID[j][i]/4;

			if((Cluster_EtaPhi[j][1]%5) == 0){
				//Then this crystal is on the boundary
				crystal_num = Cluster_EtaPhi[j][i]/5;
				 success[j][i] = stitch_on_left(i,j,tower_num, crystal_num, ClusterET, Cluster_TowerID, Cluster_EtaPhi);


			}
		}


		if((Cluster_TowerID[j][i]%4) == 3){
			//First boundary in tower
			tower_num = Cluster_TowerID/4;

			if((Cluster_EtaPhi[j][i]%5) == 4){
				//Then this crystal is on second boundary
				crystal_num = Cluster_EtaPhi[j][i]/5;

				success[j][i] = stitch_on_right(i,j,tower_num, crystal_num, ClusterET, Cluster_TowerID, Cluster_EtaPhi);

			}
		}



		}
	}



return(0);
}


bool stitch_on_left(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in]){


	//Find if there is a cluster in a tower next to it
	if((i - 4) < 0){
		//Case 1: when cluster is on main boundary, so only two phi rows
		for(int k = i - 2; k < i; k++){
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
				if(((Cluster_TowerID[l][k]/4) == tower_num) && ((Cluster_TowerID[l][k]%4) == 3)){
					//this means tower number is same
					if(((Cluster_EtaPhi[l][k]/5) == crystal_num) && ((Cluster_EtaPhi[l][k]%5) == 4)){
						//This is right next crystal
					if(ClusterET[j][i] >= ClusterET[l][k]){
						//add the ET
						ClusterET[j][i] += ClusterET[l][k];
						ClusterET[l][k] = 0;
						//how to remove towerID and eta phi of other cluster
						break;
					}
					else{
						ClusterET[l][k] +=  ClusterET[j][i];
						ClusterET[j][i] = 0;
						//remove towerID and eta phi
						break;
					}

					}
				}
			}
		}
	}
	else{
		//Case2: These have 4 phi rows to check as cluster is on internal boundary
		for(int k = i - 4; k < i; k++){
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
				if(((Cluster_TowerID[l][k]/4) == tower_num) && ((Cluster_TowerID[l][k]%4) == 3)){
					//this means tower number is same
					if(((Cluster_EtaPhi[l][k]/5) == crystal_num) && ((Cluster_EtaPhi[l][k]%5) == 4)){
						//This is right next crystal
					if(ClusterET[j][i] >= ClusterET[l][k]){
						//add the ET
						ClusterET[j][i] += ClusterET[l][k];
						ClusterET[l][k] = 0;
						//how to remove towerID and eta phi of other cluster
						break;
					}
					else{
						ClusterET[l][k] +=  ClusterET[j][i];
						ClusterET[j][i] = 0;
						//remove towerID and eta phi
						break;
					}

					}
				}
			}
		}
	}

return true;

}



bool stitch_on_right(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in]){


	//Find if there is a cluster in a tower next to it
	if((i + 4) > NCaloLayer2Phi_in){
		//This is case 1, when cluster is on main boundary(on the other side), so only two phi rows
		for(int k = i; k < i+2; k++){
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
				if(((Cluster_TowerID[l][k]/4) == tower_num) && ((Cluster_TowerID[l][k]%4) == 0)){
					//this means tower number is same
					if(((Cluster_EtaPhi[l][k]/5) == crystal_num) && ((Cluster_EtaPhi[l][k]%5) == 0)){
						//This is right next crystal
					if(ClusterET[j][i] >= ClusterET[l][k]){
						//add the ET
						ClusterET[j][i] += ClusterET[l][k];
						ClusterET[l][k] = 0;
						//how to remove towerID and eta phi of other cluster
						break;
					}
					else{
						ClusterET[l][k] +=  ClusterET[j][i];
						ClusterET[j][i] = 0;
						//remove towerID and eta phi
						break;
					}

					}
				}
			}
		}
	}
	else{
		//Case2: These have 4 phi rows to check as cluster is on internal boundary
		for(int k = i; k < i + 4; k++){
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
				if(((Cluster_TowerID[l][k]/4) == tower_num) && ((Cluster_TowerID[l][k]%4) == 0)){
					//this means tower number is same
					if(((Cluster_EtaPhi[l][k]/5) == crystal_num) && ((Cluster_EtaPhi[l][k]%5) == 0)){
						//This is right next crystal
					if(ClusterET[j][i] >= ClusterET[l][k]){
						//add the ET
						ClusterET[j][i] += ClusterET[l][k];
						ClusterET[l][k] = 0;
						//how to remove towerID and eta phi of other cluster
						break;
					}
					else{
						ClusterET[l][k] +=  ClusterET[j][i];
						ClusterET[j][i] = 0;
						//remove towerID and eta phi
						break;
					}

				}
			}

			}
		}
	}

return true;

}
