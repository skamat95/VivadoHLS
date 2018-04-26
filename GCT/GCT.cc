#include "GCT.hh"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>



int GCT(uint16_t Tower_in[NCaloLayer2Eta][NCaloLayer2Phi_in],
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint16_t Tower_out[NCaloLayer2Eta][NCaloLayer2Phi_out],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out])
{

#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in dim=1
#pragma HLS ARRAY_PARTITION variable=ClusterET_in dim=1
#pragma HLS ARRAY_PARTITION variable=Tower_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out dim=1
#pragma HLS ARRAY_PARTITION variable=ClusterET_out dim=1
#pragma HLS ARRAY_PARTITION variable=Tower_out dim=1

	uint16_t tower_num = 0;
	uint16_t crystal_num = 0;

	bool success[3][28] = {false}; //to keep a track of all clusters successful mergers or not

	//For all clusters check if they are on the boundary
	for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL


		//This for loop is only to Put tower data in output, ignore it
		for(int t=0; t < NCaloLayer2Eta; t++){
#pragma HLS UNROLL
			Tower_out[t][i] = Tower_in[t][i];
		}

		for(int j = 0; j < NCaloLayer2ClustersPerPhi; j++){
#pragma HLS UNROLL


			//Put data in output
			ClusterET_out[j][i] = ClusterET_in[j][i];
			Cluster_TowerID_out[j][i] = Cluster_TowerID_in[j][i];
			Cluster_EtaPhi_out[j][i] = Cluster_EtaPhi_in[j][i];

		if((Cluster_TowerID_in[j][i]%4) == 0){
			//First boundary in tower
			tower_num = Cluster_TowerID_in[j][i]/4;

			if((Cluster_EtaPhi_in[j][1]%5) == 0){
				//Then this crystal is on the boundary
				crystal_num = Cluster_EtaPhi_in[j][i]/5;
				 success[j][i] = stitch_on_left(i,j,tower_num, crystal_num, ClusterET_in, Cluster_TowerID_in, Cluster_EtaPhi_in, ClusterET_out, Cluster_TowerID_out, Cluster_EtaPhi_out);
				 break;

			}
		}


		if((Cluster_TowerID_in[j][i]%4) == 3){
			//First boundary in tower
			tower_num = Cluster_TowerID_in[j][i]/4;

			if((Cluster_EtaPhi_in[j][i]%5) == 4){
				//Then this crystal is on second boundary
				crystal_num = Cluster_EtaPhi_in[j][i]/5;

				success[j][i] = stitch_on_right(i,j,tower_num, crystal_num, ClusterET_in, Cluster_TowerID_in, Cluster_EtaPhi_in, ClusterET_out, Cluster_TowerID_out, Cluster_EtaPhi_out);
				break;
			}
		}



		}
	}



return(0);
}


bool stitch_on_left(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out]){


	//Find if there is a cluster in a tower next to it
	if((i - 4) < 0){
		//Case 1: when cluster is on main boundary, so only two phi rows
		for(int k = i - 2; k < i; k++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=2

			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 3)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 4)){
						//This is right next crystal
					if(ClusterET_in[j][i] >= ClusterET_in[l][k]){
						//add the ET
						ClusterET_out[j][i] = ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[l][k] = 0;

						break;
					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[j][i] = 0;

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
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 3)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 4)){
						//This is right next crystal
					if(ClusterET_in[j][i] >= ClusterET_in[l][k]){
						//add the ET
						ClusterET_out[j][i] = ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[l][k] = 0;

						break;
					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[j][i] = 0;

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
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out]){


	//Find if there is a cluster in a tower next to it
	if((i + 4) > NCaloLayer2Phi_in){
		//This is case 1, when cluster is on main boundary(on the other side), so only two phi rows
		for(int k = i; k < i+2; k++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=2
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 0)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 0)){
						//This is right next crystal
					if(ClusterET_in[j][i] >= ClusterET_in[l][k]){
						//add the ET
						ClusterET_out[j][i] = ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[l][k] = 0;

						break;
					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[l][k] + ClusterET_in[j][i];
						ClusterET_out[j][i] = 0;

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
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 0)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 0)){
						//This is right next crystal
					if(ClusterET_in[j][i] >= ClusterET_in[l][k]){
						//add the ET
						ClusterET_out[j][i] = ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[l][k] = 0;

						break;
					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[l][k] + ClusterET_in[j][i];
						ClusterET_out[j][i] = 0;

						break;
					}

				}
			}

			}
		}
	}

return true;

}
