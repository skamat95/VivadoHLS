#include <stdint.h>
#include <math.h>
#include "MET_LUT.h"
#include <ap_fixed.h>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cmath>
#include "stdio.h"
#include "sqrt.h"
#include "atan2.h"
using namespace std;


void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], algo_out &output)
{



#pragma HLS PIPELINE II=6
#pragma HLS ARRAY_PARTITION variable=rgn_in complete dim=0
#pragma HLS INTERFACE ap_none port=&output
#pragma HLS ARRAY_PARTITION variable=output.MET complete dim=0

	uint16_t rgn_ET, tower_phi, rgn_tmp;
	int inr_x, inr_y;

	ap_fixed<20,17> temp[2] = {0,0};
	ap_uint<27> MET_sq[2] = {0,0};
	ap_uint<27> MET_res = 0;

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
	  		temp[0] += ap_fixed<20,17> (rgn_sum[itwr] * cosLUT[iRgn][itwr]);
	  		temp[1] += ap_fixed<20,17> (rgn_sum[itwr] * sineLUT[iRgn][itwr]);
	  	}
	}

	output.MET[0] = temp[0];
	output.MET[1] = temp[1];

	MET_sq[0] = (output.MET[0] * output.MET[0]);
	MET_sq[1] = (output.MET[1] * output.MET[1]);
	MET_res = MET_sq[0] + MET_sq[1];
		//Output of the function: MET[0]- X sum, MET[1] - Y sum, MET_res- addition of squares of X and Y



	hls::sqrt_input<InputWidth_sqrt, DataFormat_sqrt>::in x_sqrt;

	x_sqrt.in = MET_res;
	sqrt_top(x_sqrt,output.sqrtX);

	hls::atan2_input<InputWidth_atan>::cartesian x_atan;
	x_atan.cartesian.real() = output.MET[0];
	x_atan.cartesian.imag() = output.MET[1];

	atan2_top(x_atan,output.atanX);



}

void sqrt_top(const hls::sqrt_input<InputWidth_sqrt, DataFormat_sqrt>::in &x,
              hls::sqrt_output<OutputWidth_sqrt, DataFormat_sqrt>::out &sqrtX){
  // Call square root function
  hls::sqrt<DataFormat_sqrt,InputWidth_sqrt,OutputWidth_sqrt,RoundMode_sqrt>(x, sqrtX);

}

void atan2_top(const hls::atan2_input<InputWidth_atan>::cartesian &x,
               hls::atan2_output<OutputWidth_atan>::phase &atanX){

  // Call arctan function
  hls::atan2<PhaseFormat_atan,InputWidth_atan,OutputWidth_atan,RoundMode_atan>(x, atanX);

}

