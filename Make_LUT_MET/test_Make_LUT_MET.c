#include <stdint.h>
#include <stdio.h>

#include "Make_LUT_MET.h"


#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8

int main(int argc, char **argv) {

	int in = 90;
	float out[3];
	Make_LUT_MET(in,out);
	printf("ans_sine = %f\n",out[0]);
	printf("ans_cos = %f\n",out[1]);
	printf("ans_atan = %f\n",out[2]);
	/*
	uint16_t rgnET[NCrts*NCrds*NRgns];
	uint16_t rgnPhi[NCrts*NCrds*NRgns];
	uint16_t hfET[NCrts*NHFRgns];
	uint16_t hfPhi[NCrts*NHFRgns];
	uint16_t MET[2];
	uint64_t MET_theta[1];
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
				rgnET[i] = 1;
				rgnPhi[i] = 1;
			}
		}
		for(iHFRgn = 0; iHFRgn < NHFRgns; iHFRgn++) {
			i = iCrt * NHFRgns + iHFRgn;
			hfET[i] = 1;
			hfPhi[i] = 1;
		}
	}


	//Test code
	MakeMET(rgnET,rgnPhi,hfET,hfPhi,MET,MET_theta);

	printf("METx = %d\n",MET[0]);
	printf("METy = %d\n",MET[1]);
	printf("Theta_U = %lld\n",MET_theta[0]);


*/


	return 0;

}
