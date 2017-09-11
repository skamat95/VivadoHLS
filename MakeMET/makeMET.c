#include <stdint.h>
#include "MakeHT.h"

void MakeHT(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t hfET[NCrts*NHFRgns], uint16_t HT[1]) {
	uint16_t rgnHT = 0;
	uint16_t hfHT = 0;
iRgn:
	for(int iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++) {
		if(rgnET[iRgn] > MinETCutForHT) rgnHT += rgnET[iRgn];
	}
iHFRgn:
 	for(int iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++) {
 		if(hfET[iHFRgn] > MinHFETCutForHT) hfHT += hfET[iHFRgn];
 	}
	HT[0] = rgnHT + hfHT;
}