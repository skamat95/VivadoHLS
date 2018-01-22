//#include "L1Trigger/L1TCalorimeter/interface/CordicXIP.h"
#include "CordicXIP.h"

#include <vector>
#include <iostream>
#include <iomanip> 
#include <math.h>
#include <byteswap.h>

#include "cordic_v6_0_bitacc_cmodel.h"
#include "gmp.h"

CordicXIP::CordicXIP(int inputBits, int magBits, int phiBits) :
    inputBits_(inputBits),
    magBits_(magBits),
    phiBits_(phiBits)
{
    xip_cordic_v6_0_config config;
    xip_cordic_v6_0_default_config(&config);
    config.CordicFunction = XIP_CORDIC_V6_0_F_TRANSLATE;
    config.CoarseRotate   = 1;
    config.DataFormat     = XIP_CORDIC_V6_0_FORMAT_SIG_FRAC;
    config.PhaseFormat    = XIP_CORDIC_V6_0_FORMAT_RAD;
    config.InputWidth     = inputBits_;
    config.OutputWidth    = magBits_;
    config.Precision      = 0;
    config.RoundMode      = XIP_CORDIC_V6_0_ROUND_TRUNCATE;
    config.ScaleComp      = XIP_CORDIC_V6_0_SCALE_EMB_MULT;
    //config.ScaleComp      = XIP_CORDIC_V6_0_SCALE_NONE;

    xip_handle_ = xip_cordic_v6_0_create(&config, [](void* dummy, int error, const char* msg)->void{std::cerr << msg << std::endl;}, 0);

    xip_array_complex* cartin = xip_array_complex_create();
    xip_array_complex_reserve_dim(cartin,1);
    cartin->dim_size = 1;
    cartin->dim[0] = 1;
    cartin->data_size = cartin->dim[0];
    if (xip_array_complex_reserve_data(cartin,cartin->data_size) != XIP_STATUS_OK ) {
      std::cerr << "ERROR: Unable to reserve memory for input data packet!" << std::endl;
    }

    xip_array_real* magout = xip_array_real_create();
    xip_array_real_reserve_dim(magout,1);
    magout->dim_size = 1;
    magout->dim[0] = 1;
    magout->data_size = magout->dim[0];
    if (xip_array_real_reserve_data(magout,magout->data_size) != XIP_STATUS_OK) {
      std::cerr << "ERROR: Unable to reserve memory for output data packet!" << std::endl;
    }
  
    xip_array_real* phaseout = xip_array_real_create();
    xip_array_real_reserve_dim(phaseout,1);
    phaseout->dim_size = 1;
    phaseout->dim[0] = 1;
    phaseout->data_size = phaseout->dim[0];
    if (xip_array_real_reserve_data(phaseout,phaseout->data_size) != XIP_STATUS_OK) {
      std::cerr << "ERROR: Unable to reserve memory for output data packet!" << std::endl;
    }

    cartin_ = cartin;
    magout_ = magout;
    phaseout_ = phaseout;
}

CordicXIP::~CordicXIP()
{
    if ( cartin_ ) xip_array_complex_destroy(cartin_);
    if ( magout_) xip_array_real_destroy(magout_);
    if ( phaseout_) xip_array_real_destroy(phaseout_);
    xip_cordic_v6_0_destroy(xip_handle_);
}

void CordicXIP::operator() ( int32_t aX , int32_t aY , int32_t& aPhi , uint32_t& aMagnitude )
{
    xip_cordic_v6_0_xip_array_complex_set_data(cartin_, {(double) aX, (double) aY}, 0);   

    auto status = xip_cordic_v6_0_translate(xip_handle_, cartin_, magout_, phaseout_, 1);
    if ( status != XIP_STATUS_OK ) std::cout << "Translation failed" << std::endl;

    double mag_out_samp;
    double phase_out_samp;
    xip_cordic_v6_0_xip_array_real_get_data(magout_, &mag_out_samp, 0);
    xip_cordic_v6_0_xip_array_real_get_data(phaseout_, &phase_out_samp, 0);

    aMagnitude = (uint32_t) mag_out_samp;
    aPhi = (int32_t) phase_out_samp;
}
