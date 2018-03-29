#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NTwrs 4


//#include "ap_int.h"
//#define uint12_t ap_uint<12>

#include <stdint.h>
#include <math.h>
#include "sine1.h"
#include "cos1.h"
#include "hls_dsp.h"
#include "sqrt.h"
#include "atan2.h"

void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], ap_fixed<20,17> MET[2],
		hls::sqrt_output<OutputWidth_sqrt, DataFormat_sqrt>::out &sqrtX,
		hls::atan2_output<OutputWidth_atan>::phase &atanX
		);




#endif
