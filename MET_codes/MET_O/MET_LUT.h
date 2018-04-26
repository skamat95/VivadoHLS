#ifndef MakeMET_h
#define MakeMET_h

#define NCrts 18
#define NCrds 7
#define NRgns 2
#define NTwrs 4

#define resolution 2 //sin and cos LUTs

//ATAN2 LUT
#define max_val_x 300
#define max_val_y 300
#define resolution_x 5
#define resolution_y 5

//#include "ap_int.h"
//#define uint12_t ap_uint<12>

#include <stdint.h>
#include <math.h>
#include "sine.h"
#include "cos.h"
//#include "atan2.h"
#include "atan2_head.h"

void MET_O(uint16_t rgn_in[NCrts*NCrds*NRgns], uint16_t MET[3]);



#endif
