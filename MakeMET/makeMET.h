#ifndef MakeHT_h
#define MakeHT_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8

#define MinETCutForHT 10
#define MinHFETCutForHT 10

#include <stdint.h>

void MakeHT(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t hfET[NCrts*NHFRgns], uint16_t HT[1]);

#endif