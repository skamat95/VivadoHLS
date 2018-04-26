#include <stdint.h>
#include <math.h>
#include "MET_LUT.h"



void MET_LUT(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts],uint16_t MET[3])
{

#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnET complete dim=0


  uint16_t rgn_tmp[NCrts][NCrds*NRgns];

#pragma HLS ARRAY_PARTITION variable=rgn_tmp complete dim=0

	int inr_x, inr_y;
	uint16_t rgnMETx[NCrts];
	uint16_t rgnMETy[NCrts];
	int rgn_read = 0;

#pragma HLS ARRAY_PARTITION variable=rgnMETx complete dim=1
#pragma HLS ARRAY_PARTITION variable=rgnMETy complete dim=1



iRgn:
	for(int iRgn = 0; iRgn < NCrts; iRgn++)
	{
#pragma HLS UNROLL
	iRgn1:
	  for(int iRgn1 =0; iRgn1 < (NCrds*NRgns); iRgn1++)
	    {
#pragma HLS UNROLL
	      rgn_tmp[iRgn][iRgn1] = rgnET[iRgn * (NCrds*NRgns) + iRgn1];

	    }
	  rgn_read = rgnPhi[iRgn]/resolution;
	  rgnMETx[iRgn] = ((Comp_rgn_et_14(rgn_tmp[iRgn])) * cosLUT[rgn_read]);
	  rgnMETy[iRgn] = ((Comp_rgn_et_14(rgn_tmp[iRgn])) * sineLUT[rgn_read]);
	}

	//MET vector magnitude in X(MET[0]) and Y(MET[1]) direction separately
	int in_x = Comp_rgn_et(rgnMETx);
	int in_y = Comp_rgn_et(rgnMETy);

	//This is the calculation to reach the appropriate element number in the atan2LUT

	inr_x = (max_val_x/resolution_x) + (in_x/resolution_x);
	inr_y = (max_val_y/resolution_y) + (in_y/resolution_y);

	//This is the MET angle
	MET[0] = in_x;
	MET[1] = in_y;
	MET[2] = atan2LUT[inr_x][inr_y];

}



uint16_t Comp_rgn_et_14(uint16_t arr_i[NCrds*NRgns])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

  uint16_t tmp = 0;

 add: for (int i = 0; i < (NCrds*NRgns); i++)
    {
#pragma HLS UNROLL
      uint16_t et_reg = arr_i[i];

      tmp += et_reg;
    }

  return tmp;
}

int Comp_rgn_et(uint16_t arr_i[NCrts])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

  int tmp = 0;

 add1: for (int i = 0; i < NCrts; i++)
    {
#pragma HLS UNROLL
      uint16_t et_reg = arr_i[i];

      tmp += et_reg;
    }

  return tmp;
}
