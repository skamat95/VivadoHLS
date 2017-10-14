#include <stdint.h>
#include <math.h>
#include "Make_LUT_MET.h"



void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
			uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
			float MET[3])
{

#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=hfPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=hfET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnET complete dim=0

	int inr_x, inr_y;
	float rgnMETx = 0;
	float hfMETx = 0;
	float rgnMETy = 0;
	float hfMETy = 0;
	int rgn_read = 0;
	int hf_read =0;

iRgn:
	for(int iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++)
	{
#pragma HLS UNROLL
		rgn_read = rgnPhi[iRgn]/resolution;
		rgnMETx += (rgnET[iRgn] * cosLUT[rgn_read]);
		rgnMETy += (rgnET[iRgn] * sineLUT[rgn_read]);
	}

iHFRgn:
 	for(int iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++)
 	{
#pragma HLS UNROLL
 		hf_read = hfPhi[iHFRgn]/resolution;
 		hfMETx += (hfET[iHFRgn] * cosLUT[hf_read]);
 		hfMETy += (hfET[iHFRgn] * sineLUT[hf_read]);
 	}

	//MET vector magnitude in X(MET[0]) and Y(MET[1]) direction separately
 	//int in_x = rgnMETx + hfMETx;
 	//int in_y = rgnMETy + hfMETy;

	//This is the calculation to reach the appropriate element number in the atan2LUT

	//inr_x = (max_val_x/resolution_x) + (in_x/resolution_x);
	//inr_y = (max_val_y/resolution_y) + (in_y/resolution_y);

	//This is the MET angle
	MET[0] = rgnMETx;
	MET[1] = hfMETy;
 	//MET[2] = atan2LUT[inr_x][inr_y];

}


