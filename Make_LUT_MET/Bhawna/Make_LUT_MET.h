#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2


#define resolution 20 //sin and cos LUTs

#include <stdint.h>
#include <math.h>
#include "sine.h"
#include "cos.h"
//#include "atan2.h"


void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],float MET[2]);

uint16_t Comp_rgn_et_14(uint16_t arr_i[14]);
int Comp_rgn_et(uint16_t arr_i[18]);

#endif
