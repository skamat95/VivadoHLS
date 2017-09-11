#include <stdint.h>
#include <stdio.h>

#include "MakeHT.h"

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8

int main(int argc, char **argv) {
	uint16_t rgnET[NCrts*NCrds*NRgns];
	uint16_t hfET[NCrts*NHFRgns];

	// Test data; Construct it using indices for the fun of it

	int iCrt;
	int iCrd;
	int iRgn;
	int i;
	int iHFRgn;
	for(iCrt = 0; iCrt < NCrts; iCrt++) {
		for(iCrd = 0; iCrd < NCrds; iCrd++) {
			for(iRgn = 0; iRgn < NRgns; iRgn++) {
				i = iCrt * NCrds * NRgns + iCrd * NRgns + iRgn;
				rgnET[i] = i;
			}
		}
		for(iHFRgn = 0; iHFRgn < NHFRgns; iHFRgn++) {
			i = iCrt * NHFRgns + iHFRgn;
			hfET[i] = i;
		}
	}

	// Determine HT using software

	uint16_t HT = 0;
	for(iCrt = 0; iCrt < NCrts; iCrt++) {
		for(iCrd = 0; iCrd < NCrds; iCrd++) {
			for(iRgn = 0; iRgn < NRgns; iRgn++) {
				i = iCrt * NCrds * NRgns + iCrd * NRgns + iRgn;
				if(rgnET[i] > MinETCutForHT) HT += rgnET[i];
			}
		}
		for(iHFRgn = 0; iHFRgn < NHFRgns; iHFRgn++) {
			i = iCrt * NHFRgns + iHFRgn;
			if(hfET[i] > MinHFETCutForHT) HT += hfET[i];
		}
	}

	// Determine HT using hardware simulation

	uint16_t hlsHT = 0;
	MakeHT(rgnET, hfET, &hlsHT);

	// Compare

	printf("C says: HT = %d; HLS says: HT = %d\n", HT, hlsHT);;
	if(HT != hlsHT) {
		printf("Test failed\n");
		return 1;
	}
	else printf("Test succeeded\n");

	return 0;

}