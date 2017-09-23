#include <stdint.h>
#include <stdio.h>
#include <math.h>
#include "LUT_trial.h"




int main(int argc, char **argv) {

	float ans[2];
	LUT_trial(ans);
	printf("sine = %f\n",ans[0]);
	printf("atan = %f\n",ans[1]);


	return 0;

}
