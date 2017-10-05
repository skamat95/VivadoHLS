#include <stdint.h>
#include <math.h>
#include "Make_LUT_MET.h"



void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts],float MET[3])
{

#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=MET complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnPhi complete dim=0
#pragma HLS ARRAY_PARTITION variable=rgnET complete dim=0


  uint16_t rgn_tmp[NCrts][NCrds*NRgns];

#pragma HLS ARRAY_PARTITION variable=rgn_tmp complete dim=0  


  float rgnMETx[NCrts];
  float rgnMETy[NCrts];
	//int rgn_read = 0;

	float pi = acos(-1.0);
	float ratio = pi/180;

#pragma HLS ARRAY_PARTITION variable=rgnMETx complete dim=1
#pragma HLS ARRAY_PARTITION variable=rgnMETy complete dim=1



iRgn:
	for(int iRgn = 0; iRgn < NCrts; iRgn++)
	{
#pragma HLS UNROLL
	iRgn1:
	  for(int iRgn1 = 0; iRgn1 < (NCrds*NRgns) ; iRgn1++)
	    {
#pragma HLS UNROLL
	      rgn_tmp[iRgn][iRgn1] = rgnET[iRgn * (NCrds*NRgns) + iRgn1];

	    }
	  //rgn_read = rgnPhi[iRgn]/resolution;
	  //rgnMETx[iRgn] = ((Comp_rgn_et_14(rgn_tmp[iRgn])) * cosLUT[rgn_read]);
	  //rgnMETy[iRgn] = ((Comp_rgn_et_14(rgn_tmp[iRgn])) * sineLUT[rgn_read]);
	  rgnMETx[iRgn] = (Comp_rgn_et_14(rgn_tmp[iRgn])) * cos(rgnPhi[iRgn]*ratio);
	  rgnMETy[iRgn] = (Comp_rgn_et_14(rgn_tmp[iRgn])) * sin(rgnPhi[iRgn]*ratio);
	}

	//MET vector magnitude in X(MET[0]) and Y(MET[1]) direction separately
	float in_x = Comp_rgn_et(rgnMETx);
	float in_y = Comp_rgn_et(rgnMETy);


	MET[0] = in_x;
	MET[1] = in_y;
	//This is the calculation to reach the appropriate element number in the atan2LUT

	//int inr_x = (max_val_x/resolution_x) + (in_x/resolution_x);
	//int inr_y = (max_val_y/resolution_y) + (in_y/resolution_y);

	//This is the MET angle

	//MET[2] = atan2[inr_x][inr_y];

}



uint16_t Comp_rgn_et_14(uint16_t arr_i[NCrds*NRgns])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

  uint16_t tmp = 0;

 adder_tree: for (int i = 0; i < (NCrds*NRgns); i++)
    {
#pragma HLS UNROLL
      uint16_t et_reg = arr_i[i];

      tmp += et_reg;
    }

  return tmp;
}

float Comp_rgn_et(float arr_i[NCrts])
{
#pragma HLS PIPELINE II=6

#pragma HLS ARRAY_PARTITION variable=arr_i complete dim=1

	float tmp = 0;

 adder_tree: for (int i = 0; i < NCrts; i++)
    {
#pragma HLS UNROLL
	 float et_reg = arr_i[i];

      tmp += et_reg;
    }

  return tmp;
}
