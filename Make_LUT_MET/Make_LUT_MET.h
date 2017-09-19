#ifndef MakeMET_h
#define MakeMET_h

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
#include "atan2.h"


void Make_LUT_MET(int in,float out[3]);

#endif
