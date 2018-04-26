/*
 * mcu.c
 *
 *  Created on: Aug 1, 2017
 *      Author: daqnet
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/time.h>
#include"xparameters.h"
#include "mb_interface.h"
#include <xexample.h>


float *AvecHW = (float *)0xC0000000;
float *resHW = (float *)0xC2000000;

XExample doexample;
XExample_Config *doexample_cfg;


void init_example()
{
	int status = 0;
	doexample_cfg = XExample_LookupConfig(XPAR_EXAMPLE_0_DEVICE_ID);
	//printf("begins");
	if(doexample_cfg)
	{
		status = XExample_CfgInitialize(&doexample,doexample_cfg);
		if(status != XST_SUCCESS)
		{
			printf("Failed to init");
		}
		else
		{
			printf("init Success");
		}
	}
}

float float_to_u32(float val)
{
	unsigned int result;
	union float_bytes {
		float v;
		unsigned char bytes[4];
	}data;

	data.v = val;
	int i;

	result = (data.bytes[3] << 24) + (data.bytes[2] << 16) + (data.bytes[1] << 8) + data.bytes[0];

	/*data.bytes[3] = (val >> (8*3)) & 0xff;
	data.bytes[2] = (val >> (8*2)) & 0xff;
	data.bytes[1] = (val >> (8*1)) & 0xff;
	data.bytes[0] = (val >> (8*0)) & 0xff;*/

	return result;
}

int main()
{
	int j,k;
	init_example();

	printf("Hello world\n");


	for(j=0;j<10;j++)
	{
		AvecHW[j] = j;
	}

	XExample_Set_b(&doexample,5);
	XExample_Start(&doexample);

	while(!XExample_IsDone(&doexample));

	printf("Test finished\n");
    double temp[10];

	for(k=0;k<10;k++)
	{
		temp[k] = resHW[k];
		printf("\nData : %f", temp[k]);
	}

	return 0;
}

