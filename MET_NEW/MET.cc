#include <stdint.h>
#include <math.h>
#include "MET_LUT.h"
#include <ap_fixed.h>
#include <iostream>
#include <fstream>
#include <iomanip>
using namespace std;

void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], ap_fixed<20,17> MET[2], ap_fixed<40,35> MET_sq[2], ap_fixed<40,35> MET_res)
{

#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgn_in complete dim=0

	uint16_t rgn_ET, tower_phi, rgn_tmp;
	int inr_x, inr_y;
	ap_fixed<20,17> rgnMET_out[2] = {0,0};
	//ap_fixed<40,35> MET_sq[2] = {0,0};
	//ap_fixed<40,35> MET_res = 0;

iRgn:
	for(int iRgn = 0; iRgn < NCrts; iRgn++)
	{
#pragma HLS UNROLL
	iRgn1:
		uint16_t rgn_sum[4] = {0,0,0,0};
#pragma HLS ARRAY_PARTITION variable=rgn_sum complete dim=0
	  for(int iRgn1 =0; iRgn1 < (NCrds*NRgns); iRgn1++)
	    {
#pragma HLS UNROLL
	      rgn_tmp = rgn_in[iRgn * (NCrds*NRgns) + iRgn1] & 4095;
		  tower_phi = rgn_in[iRgn * (NCrds*NRgns) + iRgn1] & 0xC000;
		  if(tower_phi == 0) rgn_sum[0] += rgn_tmp;
		  else if(tower_phi == 1) rgn_sum[1] += rgn_tmp;
		  else if(tower_phi == 2) rgn_sum[2] += rgn_tmp;
		  else if(tower_phi == 3) rgn_sum[3] += rgn_tmp;
	    }
	  for(int itwr = 0; itwr < NTwrs; itwr++)
	  	{
	  #pragma HLS UNROLL
	  		rgnMET_out[0] += ap_fixed<20,17> (rgn_sum[itwr] * cosLUT[iRgn][itwr]);
	  		rgnMET_out[1] += ap_fixed<20,17> (rgn_sum[itwr] * sineLUT[iRgn][itwr]);
	  	}
	}

	MET[0] = rgnMET_out[0];
	MET[1] = rgnMET_out[1];
	MET_sq[0] = MET[0] * MET[0];
	MET_sq[1] = MET[1] * MET[1];
	MET_res = MET_sq[0] + MET_sq[1];
		//Output of the function: MET[0]- X sum, MET[1] - Y sum, MET_res- addition of squares of X and Y

}



