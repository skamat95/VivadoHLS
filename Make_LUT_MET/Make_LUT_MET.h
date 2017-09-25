#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8

#define resolution 2 //sin and cos LUTs
#define resolution_x 5 //atan2 LUT
#define resolution_y 5 //atan2 LUT
#define max_val_x 50
#define max_val_y 50

#include <stdint.h>
#include <math.h>
#include "sine.h"
#include "cos.h"
//#include "atan2.h"
#include "atan2_trial.h"

void Make_LUT_MET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
		uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
		float MET[3]);

#endif
