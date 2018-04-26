#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>
#include "getMET.h"

int main()
{

	int TrackPT[10];
	int TrackPhi[10];
	int CaloET[10];
	int CaloPhi[10];
	float out[3];

	for (int i = 0; i<10; i++)
	{
		TrackPT[i] = rand() % 10; //in GeV maybe?
		TrackPhi[i] = rand() % 360; //in degrees
		CaloET[i] = rand() % 10;
		CaloPhi[i] = rand() % 360;
	}

	getMET(TrackPT,TrackPhi,CaloET,CaloPhi,out);


	printf("PT_x = %f\n",out[0]);
	printf("PT_y = %f\n",out[1]);
	//printf("Theta = %f\n",out[2]);


}
