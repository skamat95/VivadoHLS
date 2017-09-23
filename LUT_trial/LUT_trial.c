#include <stdint.h>
#include <math.h>
#include "LUT_trial.h"



void LUT_trial(float ans[2])
{

	int read_s = 90/resolution;

	int read_a = 3;
	ans[0] = sineLUT[read_s];
	ans[1] = atan2LUT[read_a][read_a];


}

