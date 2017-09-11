#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include "getMET.h"
//#include "ap_int.h"

void getMET(int TrackPT[10], int TrackPhi[10], int CaloET[10], int CaloPhi[10], float out[3])
{

	//Raw PT
	float PT_Track_x = 0;
	float PT_Track_y = 0;
	float PT_Calo_x = 0;
	float PT_Calo_y = 0;

	//TrackPT
	for(int i = 0;i<10;i++)
	{
		PT_Track_x += TrackPT[i]*cos(TrackPhi[i]);
		PT_Track_y += TrackPT[i]*sin(TrackPhi[i]);
	}

	//CaloPT
	for(int j = 0;j<10;j++)
	{
		PT_Calo_x += CaloET[j]*cos(CaloPhi[j]);
		PT_Calo_y += CaloET[j]*sin(CaloPhi[j]);
	}

	//Final PT across all transverse planes

	out[0] = PT_Track_x + PT_Calo_x;
	out[1] = PT_Track_y + PT_Calo_y;
	//out[2] = (atan(out[1]/out[0])) + 180;


}
