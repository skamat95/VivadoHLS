#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8


#include <stdint.h>
#include <math.h>

void MakeMET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
			uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
			uint16_t MET[2],uint64_t MET_theta[1]);

uint64_t sine_fun(uint16_t in);
uint64_t cos_fun(uint16_t in);


#endif
