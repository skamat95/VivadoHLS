#include <stdint.h>
#include "makeMET.h"


uint64_t sine_fun(uint16_t in)
{
	uint64_t out;
	out = in - ((in*in*in)/6);
	return out;

}


uint64_t cos_fun(uint16_t in)
{
	uint64_t out;
	out = 1 - ((in*in)/2);
	return out;

}

void MakeMET(uint16_t rgnET[NCrts*NCrds*NRgns], uint16_t rgnPhi[NCrts*NCrds*NRgns],
			uint16_t hfET[NCrts*NHFRgns], uint16_t hfPhi[NCrts*NHFRgns],
			uint16_t MET[2],uint64_t MET_theta[1])
{
	uint16_t rgnMETx = 0;
	uint16_t hfMETx = 0;
	uint16_t rgnMETy = 0;
	uint16_t hfMETy = 0;
	uint16_t ratio;
	uint32_t theta;
iRgn:
	for(int iRgn = 0; iRgn < NCrts*NCrds*NRgns; iRgn++)
	{
		rgnMETx += rgnET[iRgn] * cos_fun(rgnPhi[iRgn]);
		rgnMETy += rgnET[iRgn] * sine_fun(rgnPhi[iRgn]);
	}

iHFRgn:
 	for(int iHFRgn = 0; iHFRgn < NCrts * NHFRgns; iHFRgn++)
 	{
 		hfMETx += hfET[iHFRgn] * cos_fun(hfPhi[iHFRgn]);
 		hfMETy += hfET[iHFRgn] * sine_fun(hfPhi[iHFRgn]);
 	}

 	MET[0] = rgnMETx + hfMETx;
 	MET[1] = rgnMETy + hfMETy;
 	ratio = MET[1]/MET[0];
 	MET_theta = ratio - ((ratio*ratio*ratio)/3);


}



