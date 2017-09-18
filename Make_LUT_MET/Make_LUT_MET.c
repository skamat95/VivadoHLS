#include <stdint.h>
#include "Make_LUT_MET.h"



void Make_LUT_MET(int in,float out[1])
{

	//convert deg to the value
	int read_val;
	read_val = in/resolution;
	out[0] = sineLUT[read_val];
	out[1] = cosLUT[read_val];

	/*
	  uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
			uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
			uint16_t MET[2],uint64_t MET_theta[1]


#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=MET complete dim=1
#pragma HLS ARRAY_PARTITION variable=MET_theta complete dim=1
#pragma HLS ARRAY_PARTITION variable=hfPhi complete dim=1
#pragma HLS ARRAY_PARTITION variable=hfET complete dim=1
#pragma HLS ARRAY_PARTITION variable=rgnPhi complete dim=1
#pragma HLS ARRAY_PARTITION variable=rgnET complete dim=1
	uint16_t rgnMETx = 0;
	uint16_t hfMETx = 0;
	uint16_t rgnMETy = 0;
	uint16_t hfMETy = 0;
	uint16_t ratio;

iRgn:
	for(int iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++)
	{
#pragma HLS UNROLL
		rgnMETx += rgnET[iRgn] * cosLUT(rgnPhi[iRgn]);
		rgnMETy += rgnET[iRgn] * sineLUT(rgnPhi[iRgn]);
	}

iHFRgn:
 	for(int iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++)
 	{
#pragma HLS UNROLL
 		hfMETx += hfET[iHFRgn] * cosLUT(hfPhi[iHFRgn]);
 		hfMETy += hfET[iHFRgn] * sineLUT(hfPhi[iHFRgn]);
 	}

 	MET[0] = rgnMETx + hfMETx;
 	MET[1] = rgnMETy + hfMETy;
 	ratio = MET[1]/MET[0];
 	MET_theta = ratio - ((ratio*ratio*ratio)/3);

*/

}


