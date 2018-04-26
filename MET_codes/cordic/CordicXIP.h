#ifndef CordicXIP_H
#define CordicXIP_H

#include <vector>
#include <stdint.h>
#include "cordic_v6_0_bitacc_cmodel.h"

class CordicXIP
{
  public:
    CordicXIP(int inputBits, int magBits, int phiBits);
    virtual ~CordicXIP();

    void operator() ( int32_t aX , int32_t aY , int32_t& aPhi , uint32_t& aMagnitude );

// remove from forward declaration
  private:

    int inputBits_;
    int magBits_;
    int phiBits_;
    xip_cordic_v6_0 * xip_handle_;
    
    xip_array_complex * cartin_;
    xip_array_real * magout_;
    xip_array_real * phaseout_;
};

#endif
