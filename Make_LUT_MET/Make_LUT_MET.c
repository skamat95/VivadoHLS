#include <stdint.h>
#include <math.h>
#include "Make_LUT_MET.h"



void Make_LUT_MET(int in,float out[3])
{

	//convert deg to the value
	int read_val;
	read_val = in/resolution;
	out[0] = sineLUT[read_val];
	out[1] = cosLUT[read_val];
	float in_x = -10.0;
	float in_y = 10.0;
	//logic to read atan2LUT
	int inr_x,inr_y;
	if (in_x < 0) inr_x = (max_val_x/resolution_x) - abs((in_x/resolution_x));
	else if (in_x > 0) inr_x = (max_val_x/resolution_x) + 1 + abs((in_x/resolution_x));
	else if (in_x = 0) inr_x = (max_val_x/resolution_x) + 1;

	if (in_y < 0) inr_y = (max_val_y/resolution_y) - abs((in_y/resolution_y));
	else if (in_y > 0) inr_y = (max_val_y/resolution_y) + 1 + abs((in_y/resolution_y));
	else if (in_y = 0) inr_y = (max_val_y/resolution_y) + 1;


	out[2] = atan2LUT[inr_x][inr_y];

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


