#include "GCT.hh"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>

uint7_t tower_on_left_boundary[17] = {0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64};
uint7_t tower_on_right_boundary[17] = {3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63,67};
uint7_t tower_on_eta_boundary[4] = {64,65,66,67};
uint7_t tower_eta_neg[4] = {0,1,2,3};
uint5_t crystal_on_A_boundary[5] = {0,1,2,3,4};
uint5_t crystal_on_B_boundary[5] = {4,9,14,19,24};
uint5_t crystal_on_C_boundary[5] = {20,21,22,23,24};
uint5_t crystal_on_D_boundary[5] = {0,5,10,15,20};


int GCT(uint16_t Tower_in[NCaloLayer2Eta][NCaloLayer2Phi_in][EtaDirections],
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
		uint16_t Tower_out[NCaloLayer2Eta][NCaloLayer2Phi_out][EtaDirections],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections])
{
#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=crystal_on_D_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=crystal_on_C_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=crystal_on_B_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=crystal_on_A_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=tower_on_right_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=tower_on_left_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=tower_on_eta_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=tower_eta_neg complete dim=0

#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Tower_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Tower_out complete dim=0

	//Variables for finding tower and crystal on boundary
	uint16_t tower_num = 0;
	uint16_t crystal_num = 0;
	uint10_t current_cluster_ET_in = 0;
	uint10_t current_cluster_ET_out = 0;

	//Variables for merging of clusters from recognized boundary cluster
	uint10_t ET_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint7_t TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint5_t EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};

	uint10_t ET_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint7_t TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint5_t EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};

	int temp_loop;


#pragma HLS ARRAY_PARTITION variable=ET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=EtaPhi_out complete dim=0

	//This for loop is only to Put tower data in output, ignore it
		for(int s = 2; s < NCaloLayer2Phi_in-2 ; s++){
#pragma HLS UNROLL
			for(int t = 0; t < NCaloLayer2Eta; t++){
#pragma HLS UNROLL
				for(int e = 0; e < EtaDirections; e++)
#pragma HLS UNROLL
				{
					Tower_out[t][s-2][e] = Tower_in[t][s][e];
				}
			}
		}

	bool success[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections] = {false}; //to keep a track of all clusters successful mergers or not
#pragma HLS ARRAY_PARTITION variable=success complete dim=0


		//For all clusters check if they are on the boundary
		for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL

		for(int j = 0; j < NCaloLayer2ClustersPerPhi; j++){
#pragma HLS UNROLL

			for(int e = 0; e < EtaDirections; e++){
#pragma HLS UNROLL
				//Put data in output
				ClusterET_out[j][i-2][e] = ClusterET_in[j][i][e];
				Cluster_TowerID_out[j][i-2][e] = Cluster_TowerID_in[j][i][e];
				Cluster_EtaPhi_out[j][i-2][e] = Cluster_EtaPhi_in[j][i][e];

				bool tower_left = ifExists_tower(Cluster_TowerID_in[j][i][e], tower_on_left_boundary, tower_num);
				if(tower_left){
				//First boundary in tower

				bool crystal_left = ifExists_crystal(Cluster_EtaPhi_in[j][i][e], crystal_on_D_boundary, crystal_num);
				if(crystal_left){
					//Then this crystal is on the boundary
					temp_loop = i-4;
					for(int a=0; a < 4; a++){
#pragma HLS UNROLL
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
							if((temp_loop < 0) || (temp_loop >= NCaloLayer2Phi_in)) continue;
							ET_in[b][a] = ClusterET_in[b][temp_loop][e];
							TowerID_in[b][a] = Cluster_TowerID_in[b][temp_loop][e];
							EtaPhi_in[b][a] = Cluster_EtaPhi_in[b][temp_loop][e];

						}
						temp_loop++;
					}
					current_cluster_ET_in = ClusterET_in[j][i][e];
					success[j][i][e] = stitch_on_left(current_cluster_ET_in, tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out, current_cluster_ET_out);

					 //put outputs back
					ClusterET_out[j][i-2][e] = current_cluster_ET_out;
					temp_loop = i-4;
					for(int a=0; a < 4; a++){
#pragma HLS UNROLL
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
						if((temp_loop < 2) || (temp_loop >= NCaloLayer2Phi_in-2)) continue;
						ClusterET_out[b][temp_loop-2][e] = ET_out[b][a];
						Cluster_TowerID_out[b][temp_loop-2][e] = TowerID_out[b][a];
						Cluster_EtaPhi_out[b][temp_loop-2][e] = EtaPhi_out[b][a];

						}
						temp_loop++;
					}

					continue;
				}
			}//case 1 ends here

			bool tower_right = ifExists_tower(Cluster_TowerID_in[j][i][e], tower_on_right_boundary, tower_num);
			if(tower_right){
				//First boundary in tower

				bool crystal_right = ifExists_crystal(Cluster_EtaPhi_in[j][i][e], crystal_on_B_boundary, crystal_num);
				if(crystal_right){
					//Then this crystal is on second boundary
					temp_loop = i-4;
					for(int a = 0; a < 4; a++){
#pragma HLS UNROLL
						for(int b = 0; b < NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
						if((temp_loop < 0) || (temp_loop >= NCaloLayer2Phi_in)) continue;
						ET_in[b][a] = ClusterET_in[b][temp_loop][e];
						TowerID_in[b][a] = Cluster_TowerID_in[b][temp_loop][e];
						EtaPhi_in[b][a] = Cluster_EtaPhi_in[b][temp_loop][e];

						}
						temp_loop++;
					}
					current_cluster_ET_in = ClusterET_in[j][i][e];
					success[j][i][e] = stitch_on_right(current_cluster_ET_in,tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out, current_cluster_ET_out);
					ClusterET_out[j][i-2][e] = current_cluster_ET_out;
					temp_loop = i-4;
					for(int a=0; a < 4; a++){
#pragma HLS UNROLL
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
						if((temp_loop < 2) || (temp_loop >= NCaloLayer2Phi_in-2)) continue;
						ClusterET_out[b][temp_loop-2][e] = ET_out[b][a];
						Cluster_TowerID_out[b][temp_loop-2][e] = TowerID_out[b][a];
						Cluster_EtaPhi_out[b][temp_loop-2][e] = EtaPhi_out[b][a];
						}
						temp_loop++;
					}
					continue;
				}
			}//case 2 ends here

//the 3 for loops
		}
	}
}

			//Stitching on Eta Boundary, writing in a separate loop for now
/*
		uint16_t tower_eta;
		uint16_t tower_eta_search;
		uint16_t crystal_eta;
		uint16_t crystal_eta_search;

		for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL

		for(int j = 0; j < NCaloLayer2ClustersPerPhi; j++){
#pragma HLS UNROLL
 	 	 	int e = 0;

			bool tower_eta = ifExists_tower_eta(Cluster_TowerID_in[j][i][e], tower_on_eta_boundary, tower_eta);
			if(tower_eta){
				//tower on eta boundary

				bool crystal_eta = ifExists_crystal(Cluster_EtaPhi_in[j][i][e], crystal_on_C_boundary, crystal_eta);
				if(crystal_eta){
					//Cluster on crystal eta boundary
					//Need to search for neighboring clusters
					int phi_row = i-2;
					int card_num = phi_row/4; //Layer1 card
					int phi_row_start = card_num * 4;
					current_cluster_ET_in = ClusterET_in[j][i][e];

					for(int a = phi_row_start; a < (phi_row_start + 4); a++){
#pragma HLS UNROLL
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL

							//look for clusters at the boundary
							bool tower_search_1 = ifExists_tower_eta(Cluster_TowerID_in[b][a][1], tower_eta_neg, tower_eta_search);
							if((tower_search_1) && (tower_eta_search == tower_eta)){
								//Then cluster is on boundary tower
								bool cluster_search_1 = ifExists_crystal(Cluster_EtaPhi_in[b][a][1], crystal_on_A_boundary, crystal_eta_search);
								if((cluster_search_1) && (crystal_eta_search == crystal_eta)){
									//Then it is on the crystal boundary as well
										//Merge!
										if(current_cluster_ET_in > ClusterET_in[b][a][1]){
											current_cluster_ET_out = current_cluster_ET_in + ClusterET_in[b][a][1];
											ClusterET_out[b][a][1] = 0;

										}
										else{
											ClusterET_out[b][a][1] = ClusterET_in[b][a][1] + current_cluster_ET_in;
											current_cluster_ET_out = 0;
										}

								}
							}


						}
					}

					ClusterET_out[j][i-2][0] = current_cluster_ET_out;



				}
			}
		}
	}

*/

return(0);
}


bool stitch_on_left(uint10_t current_cluster_ET_in, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint10_t current_cluster_ET_out){

#pragma HLS ARRAY_PARTITION variable=tower_on_right_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=crystal_on_B_boundary complete dim=0

#pragma HLS ARRAY_PARTITION variable=ClusterET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out complete dim=0

	//Find if there is a cluster in a tower next to it i<3 is same as i-4 < 0 condition

		//Case 1: when cluster is on main boundary, so only two phi rows
		for(int k = 0; k < NCaloLayer1Phi; k++){
#pragma HLS UNROLL

			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				int expected_rem = 3;
				bool is_tower_same = ifExists_tower_search(Cluster_TowerID_in[l][k], tower_on_right_boundary, tower_num, expected_rem);

				if(is_tower_same){
					//this means tower number is same
					int expected_rem = 4;
					bool is_crystal_same = ifExists_crystal_search(Cluster_EtaPhi_in[l][k], crystal_on_B_boundary, crystal_num, expected_rem);
					if(is_crystal_same){
						//This is right next crystal
					if(current_cluster_ET_in >= ClusterET_in[l][k]){
						//add the ET
						current_cluster_ET_out = current_cluster_ET_in + ClusterET_in[l][k];
						ClusterET_out[l][k] = 0;


					}
					else{
						ClusterET_out[l][k] =  current_cluster_ET_in + ClusterET_in[l][k];
						current_cluster_ET_out = 0;

					}

					}
				}
			}
		}


return true;

}



bool stitch_on_right(uint10_t current_cluster_ET_in, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi],
		uint10_t current_cluster_ET_out){

#pragma HLS ARRAY_PARTITION variable=crystal_on_D_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=tower_on_left_boundary complete dim=0

#pragma HLS ARRAY_PARTITION variable=ClusterET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out complete dim=0

	//Find if there is a cluster in a tower next to it

		for(int k = 0; k < NCaloLayer1Phi; k++){
#pragma HLS UNROLL
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				int expected_rem = 0;
				bool is_tower_same = ifExists_tower_search(Cluster_TowerID_in[l][k], tower_on_left_boundary, tower_num, expected_rem);
				if(is_tower_same){
					//this means tower number is same
					int expected_rem = 0;
					bool is_crystal_same = ifExists_crystal_search(Cluster_EtaPhi_in[l][k], crystal_on_D_boundary, crystal_num, expected_rem);
						if(is_crystal_same){
							//This is right next crystal
						if(current_cluster_ET_in >= ClusterET_in[l][k]){
							//add the ET
							current_cluster_ET_out = current_cluster_ET_in + ClusterET_in[l][k];
							ClusterET_out[l][k] = 0;
							}
						else{
							ClusterET_out[l][k] =  ClusterET_in[l][k] + current_cluster_ET_in;
							current_cluster_ET_out = 0;
							}

						}
				}
			}
		}

return true;

}

//Checks if the element exists in the array. If yes, it returns the element position in the variable num
bool ifExists_tower(uint7_t element, uint7_t *Array, int num){
#pragma HLS ARRAY_PARTITION variable=Array complete dim=0

	bool it_does = false;
	for(int i = 0; i < 17; i++){
#pragma HLS UNROLL
		if(element == *Array) {
			it_does = true;
			num = i;
			break;
			}
		Array++;
		}
	return it_does;
	}

//Sub-function is used in stitch_on_left function to search for tower corresponding to the cluster found on left boundary
bool ifExists_tower_search(uint7_t element, uint7_t *Array, int num, int expected_rem){
#pragma HLS ARRAY_PARTITION variable=Array complete dim=0
	bool it_does = false;
	for(int i = 0; i < 17; i++){
#pragma HLS UNROLL
		if(element == *Array) {
			if(num == i){
				int rem = element - (4*num);
				if(rem == expected_rem){
					it_does = true;
				}
			}
			break;
		}
	Array++;
	}
return it_does;
}



//This is only for searching along the eta boundary, for the tower corresponding to 'element' in 'Array', returning the position in 'num'
bool ifExists_tower_eta(uint7_t element, uint7_t *Array, int num){
	bool it_does = false;
	for(int i = 0; i < 4; i++){
#pragma HLS UNROLL
		if(element == *Array) {
			it_does = true;
			num = i;
			break;
			}
		Array++;
		}
	return it_does;
	}


//Checks if the element exists in the array. If yes, it returns the element position in the variable num
bool ifExists_crystal(uint5_t element, uint5_t *Array, int num){
#pragma HLS ARRAY_PARTITION variable=crystal_on_A_boundary complete dim=0
#pragma HLS ARRAY_PARTITION variable=Array complete dim=0
	bool it_does = false;
	for(int i = 0; i < 5; i++){
#pragma HLS UNROLL
		if(element == *Array){
			it_does = true;
			num = i;
			break;
		}
		Array++;
	}
	return it_does;

}

//Sub-function is used in stitch_on_left function to search for crystal corresponding to the cluster found on left boundary, expected_rem is also an input
bool ifExists_crystal_search(uint5_t element, uint5_t *Array, int num, int expected_rem){
#pragma HLS ARRAY_PARTITION variable=Array complete dim=0
	bool it_does = false;
		for(int i = 0; i < 5; i++){
#pragma HLS UNROLL
			if(element == *Array) {
				if(num == i){
					int rem = element - (5*num);
					if(rem == expected_rem){
						it_does = true;
					}
				}
				break;
			}
		Array++;
		}
	return it_does;
}

