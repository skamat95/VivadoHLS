#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8
#define resolution 2.0

#include <stdint.h>
#include <math.h>
#include "sine.h"
#include "cos.h"

void Make_LUT_MET(int in,float out[2]);



#endif
