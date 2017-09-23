#ifndef MakeMET_h
#define MakeMET_h

#define sin1 1
#define cos1 1
#define sin2 1
#define cos2 1

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8
#define resolution 2.0
#define resolution_x 5.0
#define resolution_y 5.0
#define max_val_x 50.0
#define max_val_y 50.0
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
