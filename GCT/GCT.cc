#include "GCT.hh"

#define uint10_t ap_uint<10>
#define uint7_t ap_uint<7>
#define uint5_t ap_uint<5>



int GCT(uint16_t Tower_in[NCaloLayer2Eta][NCaloLayer2Phi_in][EtaDirections],
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections],
		uint16_t Tower_out[NCaloLayer2Eta][NCaloLayer2Phi_out][EtaDirections],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_out][EtaDirections])
{

#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Tower_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Tower_out complete dim=0

	uint16_t tower_num = 0;
	uint16_t crystal_num = 0;
	uint10_t current_cluster_ET_in = 0;
	uint10_t current_cluster_ET_out = 0;

	uint10_t ET_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint7_t TowerID_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint5_t EtaPhi_in[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};

	uint10_t ET_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint7_t TowerID_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};
	uint5_t EtaPhi_out[NCaloLayer2ClustersPerPhi][NCaloLayer1Phi] = {0};


	//This for loop is only to Put tower data in output, ignore it
		for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL
			for(int t=0; t < NCaloLayer2Eta; t++){
#pragma HLS UNROLL
				for(int e=0; e<EtaDirections; e++)
#pragma HLS UNROLL
				{
					Tower_out[t][i-2][e] = Tower_in[t][i][e];
				}
			}
		}

	bool success[NCaloLayer2ClustersPerPhi][NCaloLayer2Phi_in][EtaDirections] = {false}; //to keep a track of all clusters successful mergers or not

	//For all clusters check if they are on the boundary
	for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL

		for(int j = 0; j < NCaloLayer2ClustersPerPhi; j++){
#pragma HLS UNROLL

			int e = 0;

				//Put data in output
				ClusterET_out[j][i-2][e] = ClusterET_in[j][i][e];
				Cluster_TowerID_out[j][i-2][e] = Cluster_TowerID_in[j][i][e];
				Cluster_EtaPhi_out[j][i-2][e] = Cluster_EtaPhi_in[j][i][e];

				if((Cluster_TowerID_in[j][i][e]%4) == 0){
				//First boundary in tower
				tower_num = Cluster_TowerID_in[j][i][e]/4;

				if((Cluster_EtaPhi_in[j][1][e]%5) == 0){
					//Then this crystal is on the boundary
					crystal_num = Cluster_EtaPhi_in[j][i][e]/5;
					int c = 0;
					for(int a=i-4; a < i; a++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
							if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
							ET_in[b][c] = ClusterET_in[b][a][e];
							TowerID_in[b][c] = Cluster_TowerID_in[b][a][e];
							EtaPhi_in[b][c] = Cluster_EtaPhi_in[b][a][e];
							c++;

						}
					}
					current_cluster_ET_in = ClusterET_in[j][i][e];
					success[j][i][e] = stitch_on_left(current_cluster_ET_in,tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out, current_cluster_ET_out);
					 //put outputs back
					ClusterET_out[j][i-2][e] = current_cluster_ET_out;
					int d = 0;
					for(int a=i-4; a < i; a++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
							if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
						ClusterET_out[b][a][e] = ET_out[b][d];
						Cluster_TowerID_out[b][a][e] = TowerID_out[b][d];
						Cluster_EtaPhi_out[b][a][e] = EtaPhi_out[b][d];
						d++;

						}
					}


				}
			}


			if((Cluster_TowerID_in[j][i][e]%4) == 3){
				//First boundary in tower
				tower_num = Cluster_TowerID_in[j][i][e]/4;

				if((Cluster_EtaPhi_in[j][i][e]%5) == 4){
					//Then this crystal is on second boundary
					crystal_num = Cluster_EtaPhi_in[j][i][e]/5;
					int e = 0;
					for(int a=i-4; a < i; a++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
							if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
						ET_in[b][e] = ClusterET_in[b][a][e];
						TowerID_in[b][e] = Cluster_TowerID_in[b][a][e];
						EtaPhi_in[b][e] = Cluster_EtaPhi_in[b][a][e];
						e++;

						}
					}
					current_cluster_ET_in = ClusterET_in[j][i][e];
					success[j][i][e] = stitch_on_right(current_cluster_ET_in,tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out, current_cluster_ET_out);
					ClusterET_out[j][i-2][e] = current_cluster_ET_out;
					int f = 0;
					for(int a=i-4; a < i; a++){
#pragma HLS UNROLL
#pragma HLS LOOP_TRIPCOUNT max=4
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL
							if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
						ClusterET_out[b][a][e] = ET_out[b][f];
						Cluster_TowerID_out[b][a][e] = TowerID_out[b][f];
						Cluster_EtaPhi_out[b][a][e] = EtaPhi_out[b][f];
						f++;

						}
					}

				}
			}

			//Stitching on Eta Boundary
			if((Cluster_TowerID_in[j][i][e] > 63) || (Cluster_TowerID_in[j][i][e] < 68)){
				//tower on eta boundary
				tower_num = Cluster_TowerID_in[j][i][e]/4; //it should be just 16 (coz 64 to 67 divided by 4 is 16)
				uint16_t tower_eta = Cluster_TowerID_in[j][i][e]%4;

				if((Cluster_EtaPhi_in[j][i][e] > 19) || (Cluster_EtaPhi_in[j][i][e] < 25)){
					//Cluster on crystal eta boundary
					crystal_num = Cluster_EtaPhi_in[j][i][e]/5; //it should be just 4 (coz 20 to 24 divided by 5 is 4)
					uint16_t crystal_eta = Cluster_EtaPhi_in[j][i][e]%5;

					//Need to search for neighboring clusters
					int phi_row = i-2;
					int card_num = phi_row/4; //Layer1 card
					int phi_row_start = card_num *4;
					current_cluster_ET_in = ClusterET_in[j][i][e];

					for(int a = phi_row_start; a < (phi_row_start + 4); a++){
#pragma HLS UNROLL
						for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
#pragma HLS UNROLL

							//look for clusters at the boundary
							if((Cluster_TowerID_in[b][a][1] >= 0) || (Cluster_TowerID_in[b][a][1] <4)){
								//Then cluster is on boundary tower
								if((Cluster_EtaPhi_in[b][a][1] >=0) || (Cluster_EtaPhi_in[b][a][1] <5)){
									//Then it is on the crystal boundary as well
									if(((Cluster_TowerID_in[b][a][1] % 4) == tower_eta) && ((Cluster_EtaPhi_in[b][a][1]%5) == crystal_eta)){
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
					}

					ClusterET_out[j][i-2][0] = current_cluster_ET_out;



				}
			}

	//For 2 for loops

		}
	}



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
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 3)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 4)){
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

#pragma HLS ARRAY_PARTITION variable=ClusterET_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in complete dim=0
#pragma HLS ARRAY_PARTITION variable=ClusterET_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out complete dim=0
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out complete dim=0

	//Find if there is a cluster in a tower next to it

		//This is case 1, when cluster is on main boundary(on the other side), so only two phi rows
		for(int k = 0; k < NCaloLayer1Phi; k++){
#pragma HLS UNROLL
			for (int l = 0; l < NCaloLayer2ClustersPerPhi; l++){
#pragma HLS UNROLL
				if(((Cluster_TowerID_in[l][k]/4) == tower_num) && ((Cluster_TowerID_in[l][k]%4) == 0)){
					//this means tower number is same
					if(((Cluster_EtaPhi_in[l][k]/5) == crystal_num) && ((Cluster_EtaPhi_in[l][k]%5) == 0)){
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
