#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2


#include <stdint.h>
//#include <hls_math.h>
//#include "sine.h"
//#include "cos.h"
//#include "atan2.h"


void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts],uint16_t MET[3]);

uint16_t Comp_rgn_et_14(uint16_t arr_i[14]);
uint16_t Comp_rgn_et(uint16_t arr_i[18]);

#endif
