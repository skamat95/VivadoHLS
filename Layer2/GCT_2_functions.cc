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

	uint10_t ET_in[3][4] = {0};
	uint7_t TowerID_in[3][4] = {0};
	uint5_t EtaPhi_in[3][4] = {0};
	uint10_t ET_out[3][4] = {0};
	uint7_t TowerID_out[3][4] = {0};
	uint5_t EtaPhi_out[3][4] = {0};
	//This for loop is only to Put tower data in output, ignore it
		for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
	#pragma HLS UNROLL
		for(int t=0; t < NCaloLayer2Eta; t++){
	#pragma HLS UNROLL
			Tower_out[t][i] = Tower_in[t][i];
			}
		}

	bool success[3][28] = {false}; //to keep a track of all clusters successful mergers or not

	//For all clusters check if they are on the boundary
	for(int i = 2; i < NCaloLayer2Phi_in-2 ; i++){
#pragma HLS UNROLL

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
				int c = 0;
				for(int a=i-4; a < i; a++){
#pragma HLS LOOP_TRIPCOUNT max=4
					for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
						if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
					ET_in[b][c] = ClusterET_in[b][a];
					TowerID_in[b][c] = Cluster_TowerID_in[b][a];
					EtaPhi_in[b][c] = Cluster_EtaPhi_in[b][a];
					c++;

					}
				}
				 success[j][i] = stitch_on_left(i,j,tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out);
				 //put outputs back
				int d = 0;
				for(int a=i-4; a < i; a++){
#pragma HLS LOOP_TRIPCOUNT max=4
					for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
						if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
					ClusterET_out[b][a] = ET_out[b][d];
					Cluster_TowerID_out[b][a] = TowerID_out[b][d];
					Cluster_EtaPhi_out[b][a] = EtaPhi_out[b][d];
					d++;

					}
				}


			}
		}


		if((Cluster_TowerID_in[j][i]%4) == 3){
			//First boundary in tower
			tower_num = Cluster_TowerID_in[j][i]/4;

			if((Cluster_EtaPhi_in[j][i]%5) == 4){
				//Then this crystal is on second boundary
				crystal_num = Cluster_EtaPhi_in[j][i]/5;
				int e = 0;
				for(int a=i-4; a < i; a++){
#pragma HLS LOOP_TRIPCOUNT max=4
					for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
						if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
					ET_in[b][e] = ClusterET_in[b][a];
					TowerID_in[b][e] = Cluster_TowerID_in[b][a];
					EtaPhi_in[b][e] = Cluster_EtaPhi_in[b][a];
					e++;

					}
				}
				success[j][i] = stitch_on_right(i,j,tower_num, crystal_num, ET_in, TowerID_in, EtaPhi_in, ET_out, TowerID_out, EtaPhi_out);
				int f = 0;
				for(int a=i-4; a < i; a++){
#pragma HLS LOOP_TRIPCOUNT max=4
					for(int b=0; b<NCaloLayer2ClustersPerPhi; b++){
						if((a < NCaloLayer2Phi_in) || (a > NCaloLayer2Phi_in)) break;
					ClusterET_out[b][a] = ET_out[b][f];
					Cluster_TowerID_out[b][a] = TowerID_out[b][f];
					Cluster_EtaPhi_out[b][a] = EtaPhi_out[b][f];
					f++;

					}
				}

			}
		}



		}
	}



return(0);
}


bool stitch_on_left(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][4],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][4],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][4],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][4],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][4],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][4]){

#pragma HLS ARRAY_PARTITION variable=ClusterET_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in dim=1
#pragma HLS ARRAY_PARTITION variable=ClusterET_out dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out dim=1

	//Find if there is a cluster in a tower next to it i<3 is same as i-4 < 0 condition
 
		//Case 1: when cluster is on main boundary, so only two phi rows
		for(int k = 0; k < 4; k++){
#pragma HLS UNROLL

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


					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[j][i] + ClusterET_in[l][k];
						ClusterET_out[j][i] = 0;

					}

					}
				}
			}
		}


return true;

}



bool stitch_on_right(int i, int j, uint16_t tower_num, uint16_t crystal_num,
		uint10_t ClusterET_in[NCaloLayer2ClustersPerPhi][4],
		uint7_t Cluster_TowerID_in[NCaloLayer2ClustersPerPhi][4],
	    uint5_t Cluster_EtaPhi_in[NCaloLayer2ClustersPerPhi][4],
		uint10_t ClusterET_out[NCaloLayer2ClustersPerPhi][4],
		uint7_t Cluster_TowerID_out[NCaloLayer2ClustersPerPhi][4],
		uint5_t Cluster_EtaPhi_out[NCaloLayer2ClustersPerPhi][4]){

#pragma HLS ARRAY_PARTITION variable=ClusterET_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_in dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_in dim=1
#pragma HLS ARRAY_PARTITION variable=ClusterET_out dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_TowerID_out dim=1
#pragma HLS ARRAY_PARTITION variable=Cluster_EtaPhi_out dim=1

	//Find if there is a cluster in a tower next to it

		//This is case 1, when cluster is on main boundary(on the other side), so only two phi rows
		for(int k = 0; k < 4; k++){
#pragma HLS UNROLL
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


					}
					else{
						ClusterET_out[l][k] =  ClusterET_in[l][k] + ClusterET_in[j][i];
						ClusterET_out[j][i] = 0;


					}

					}
				}
			}
		}

return true;

}

