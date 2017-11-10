#include <stdint.h>
#include <hls_math.h>
#include "MET_LUT.h"
#define pi acos(-1)
//#include "ap_int.h"

void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], uint16_t MET[2])
{

#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgn_in complete dim=0

	uint16_t rgn_ET, tower_phi, rgn_tmp;
	int inr_x, inr_y;
	uint16_t rgnMETx = 0;
	uint16_t rgnMETy = 0;




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
	      rgn_tmp = rgn_in[iRgn * (NCrds*NRgns) + iRgn1] && 0x0FFF;
		  tower_phi = rgn_in[iRgn * (NCrds*NRgns) + iRgn1] && 0xC000;
		  if(tower_phi == 0) rgn_sum[0] += rgn_tmp;
		  else if(tower_phi == 1) rgn_sum[1] += rgn_tmp;
		  else if(tower_phi == 2) rgn_sum[2] += rgn_tmp;
		  else if(tower_phi == 3) rgn_sum[3] += rgn_tmp;
	    }
		for(int itwr = 0; itwr < NTwrs; itwr++)
		{
#pragma HLS UNROLL
			uint16_t phi_read = (NCrts * 20) + ((NTwrs+1) * 2.5);
			rgnMETx += (rgn_sum[itwr] * cos(phi_read*(pi/180)));
			rgnMETy += (rgn_sum[itwr] * sin(phi_read*(pi/180)));
		}

	}

	
	MET[0] = rgnMETx;
	MET[1] = rgnMETy;
	//MET[2] = atan2(rgnMETy,rgnMETx);

}



