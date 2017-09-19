#include <stdint.h>
#include <math.h>
#include "Make_LUT_MET.h"



void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
			uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
			float MET[3])
{

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
		rgnMETx += rgnET[iRgn] * cosLUT((rgnPhi[iRgn]/resolution));
		rgnMETy += rgnET[iRgn] * sineLUT((rgnPhi[iRgn]/resolution));
	}

iHFRgn:
 	for(int iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++)
 	{
#pragma HLS UNROLL
 		hfMETx += hfET[iHFRgn] * cosLUT((hfPhi[iHFRgn]/resolution));
 		hfMETy += hfET[iHFRgn] * sineLUT((hfPhi[iHFRgn]/resolution));
 	}

 	MET[0] = rgnMETx + hfMETx;
 	MET[1] = rgnMETy + hfMETy;
	int inr_x = MET[0];
	int inr_y = MET[1];
	if (in_x < 0) inr_x = (max_val_x/resolution_x) - abs(in_x/resolution_x);
	else if (in_x > 0) inr_x = (max_val_x/resolution_x) + abs(in_x/resolution_x);
	else if (in_x == 0) inr_x = (max_val_x/resolution_x) ;

	if (in_y < 0) inr_y = (max_val_y/resolution_y) - abs((in_y/resolution_y));
	else if (in_y > 0) inr_y = (max_val_y/resolution_y) + abs(in_y/resolution_y);
	else if (in_y == 0) inr_y = (max_val_y/resolution_y);
 	MET[2] = atan2LUT[inr_x][inr_y];

}


