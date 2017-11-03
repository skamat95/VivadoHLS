#include <stdint.h>
#include <math.h>
#include "MET_LUT.h"
//#include "ap_int.h"

void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], uint16_t MET[3])
{

#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgn_in complete dim=0

	uint16_t rgn_ET, tower_phi, rgn_tmp;
	int inr_x, inr_y;
	uint16_t rgnMETx = 0;
	uint16_t rgnMETy = 0;
	

#pragma HLS ARRAY_PARTITION variable=rgnMETx complete dim=1
#pragma HLS ARRAY_PARTITION variable=rgnMETy complete dim=1



iRgn:
	for(int iRgn = 0; iRgn < NCrts; iRgn++)
	{
#pragma HLS UNROLL
	iRgn1:
		uint16_t rgn_sum[4] = 0;
		#pragma HLS ARRAY_PARTITION variable=rgn_sum complete dim=1
	  for(int iRgn1 =0; iRgn1 < (NCrds*NRgns); iRgn1++)
	    {
#pragma HLS UNROLL
	      rgn_tmp = rgnET[iRgn * (NCrds*NRgns) + iRgn1] && 0x0FFF;
		  tower_phi = rgnET[iRgn * (NCrds*NRgns) + iRgn1] && 0xC000;
		  if(tower_phi == 0) rgn_sum[0] += rgn_tmp;
		  else if(tower_phi == 1) rgn_sum[1] += rgn_tmp;
		  else if(tower_phi == 2) rgn_sum[2] += rgn_tmp;
		  else if(tower_phi == 3) rgn_sum[3] += rgn_tmp;
	    }
		for(int itwr = 0; itwr < NTwrs; itwr++)
		{
			rgnMETx += rgn_sum[itwr] * cosLUT[NCrts][itwr];
			rgnMETy += rgn_sum[itwr] * sinLUT[NCrts][itwr];
		}

	}

	

	//This is the calculation to reach the appropriate element number in the atan2LUT

	inr_x = (max_val_x/resolution_x) + (rgnMETx/resolution_x);
	inr_y = (max_val_y/resolution_y) + (rgnMETy/resolution_y);

	//This is the MET angle
	MET[0] = rgnMETx;
	MET[1] = rgnMETy;
	MET[2] = atan2LUT[inr_x][inr_y];

}



