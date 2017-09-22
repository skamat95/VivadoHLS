#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include "Make_LUT_MET.h"


#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NHFRgns 8

int main(int argc, char **argv) {

	uint16_t rgnET[NCrts*NCrds*NRgns];
	uint16_t rgnPhi[NCrts*NCrds*NRgns];
	uint16_t hfET[NCrts*NHFRgns];
	uint16_t hfPhi[NCrts*NHFRgns];
	float MET[3];
	
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
				rgnET[i] = 0.1;
				rgnPhi[i] = 45;
			}
		}
		for(iHFRgn = 0; iHFRgn < NHFRgns; iHFRgn++) {
			i = iCrt * NHFRgns + iHFRgn;
			hfET[i] = 0.1;
			hfPhi[i] = 45;
		}
	}


	//Test code
	Make_LUT_MET(rgnET,rgnPhi,hfET,hfPhi,MET);

	printf("METx = %f\n",MET[0]);
	printf("METy = %f\n",MET[1]);
	printf("Theta = %f\n",MET[2]);

	//Calculating using math libraries
	float real_t = atan2(MET[1],MET[0]);
	printf("Test bench Theta = %f\n",real_t);
	return 0;

}
