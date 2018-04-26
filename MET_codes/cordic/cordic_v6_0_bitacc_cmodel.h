// d52cbaca0ef8cf4fd3d6354deb5066970fb6511d02d18d15835e6014ed847fb0
//  (c) Copyright 2013 Xilinx, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Xilinx, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  Xilinx, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) Xilinx shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or Xilinx had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  Xilinx products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of Xilinx products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------------------

#ifndef XIP_CORDIC_V6_0_BITACC_CMODEL_H
#define XIP_CORDIC_V6_0_BITACC_CMODEL_H

// Common typedefs, constants and functions for use across Xilinx bit-accurate C models
#undef XIP_XILINX_XIP_TARGET
#define XIP_XILINX_XIP_TARGET cordic_v6_0
#include "xip_common_bitacc_cmodel.h"
#include "xip_mpz_bitacc_cmodel.h"

#ifdef __cplusplus
extern "C" {
#endif

//Depreciated; these functions now defined within model
#define DEFINE_XIP_ARRAY(TYPE)

//Depreciated; use xip_status/XIP_STATUS_* instead
typedef xip_status xip_cordic_v6_0_status;
#define XIP_CORDIC_V6_0_STATUS_OK    XIP_STATUS_OK
#define XIP_CORDIC_V6_0_STATUS_ERROR XIP_STATUS_ERROR

/* Core Specific Constants */

// Values for CordicFunction (C_CORDIC_FUNCTION)
#define XIP_CORDIC_V6_0_F_ROTATE      0
#define XIP_CORDIC_V6_0_F_TRANSLATE   1
#define XIP_CORDIC_V6_0_F_SIN_COS     2
#define XIP_CORDIC_V6_0_F_ATAN        3
#define XIP_CORDIC_V6_0_F_SINH_COSH   4
#define XIP_CORDIC_V6_0_F_ATANH       5
#define XIP_CORDIC_V6_0_F_SQRT        6

//Definition of presence for boolean parameters
#define XIP_CORDIC_V6_0_FALSE  0
#define XIP_CORDIC_V6_0_TRUE   1

//Definition for C_ARCHITECTURE
//These are not used by the C model as they do not affect output values, only timing.
#define XIP_CORDIC_V6_0_BSER_ARCH 0
#define XIP_CORDIC_V6_0_WSER_ARCH 1
#define XIP_CORDIC_V6_0_PARA_ARCH 2

//Values for DataFormat (C_DATA_FORMAT)
#define XIP_CORDIC_V6_0_FORMAT_SIG_FRAC   0
#define XIP_CORDIC_V6_0_FORMAT_USIG_FRAC  1
#define XIP_CORDIC_V6_0_FORMAT_USIG_INT   2

//Values for PhaseFormat (C_PHASE_FORMAT)
#define XIP_CORDIC_V6_0_FORMAT_RAD 0
#define XIP_CORDIC_V6_0_FORMAT_SCA 1

//Limits for InputWidth and OutputWidth
#define XIP_CORDIC_V6_0_DATA_WIDTH_MIN 8
#define XIP_CORDIC_V6_0_DATA_WIDTH_MAX 48

//Values for RoundMode (C_ROUND_MODE)
#define XIP_CORDIC_V6_0_ROUND_TRUNCATE     0
#define XIP_CORDIC_V6_0_ROUND_POS_INF      1
#define XIP_CORDIC_V6_0_ROUND_POS_NEG_INF  2
#define XIP_CORDIC_V6_0_ROUND_NEAREST_EVEN 3

//Values for ScaleComp
//C_SCALE_COMP will be none, off = 0  or on = 1, 2, 3.
//It doesn't matter to the model which implementation of scaling is used, just that it is.
#define XIP_CORDIC_V6_0_SCALE_NONE     0
#define XIP_CORDIC_V6_0_SCALE_LUT      1
#define XIP_CORDIC_V6_0_SCALE_BRAM     2
#define XIP_CORDIC_V6_0_SCALE_EMB_MULT 3

//C_PIPELINE_MODE does not affect bit accuracy so is not in c model.

// cordic_v6_0 configuration structure
typedef struct
{
  const char *name;    //@- Instance name (arbitrary)
  xip_uint CordicFunction;  //@- Rotate,trans,sincos,atan,sinhcosh,atanh,sqrt
  xip_uint CoarseRotate;    //@- XIP_CORDIC_V6_0_FALSE or XIP_CORDIC_V6_0_TRUE
  xip_uint DataFormat;      //@-
  xip_uint PhaseFormat;     //@-
  xip_uint InputWidth;
  xip_uint OutputWidth;
  xip_uint Iterations;
  xip_uint Precision;
  xip_uint RoundMode;
  xip_uint ScaleComp;
  int debug;
} xip_cordic_v6_0_config;

// cordic_v6_0 handle type (opaque to user)
struct _xip_cordic_v6_0;
typedef struct _xip_cordic_v6_0 xip_cordic_v6_0;

//Helpers for accessing data
XIP_XILINX_XIP_IMPEXP const xip_status xip_cordic_v6_0_xip_array_real_set_data(xip_array_real* p, const xip_real  value, size_t sample);
XIP_XILINX_XIP_IMPEXP const xip_status xip_cordic_v6_0_xip_array_real_get_data(const xip_array_real* p, xip_real* value, size_t sample);
XIP_XILINX_XIP_IMPEXP const xip_status xip_cordic_v6_0_xip_array_complex_set_data(xip_array_complex* p, const xip_complex  value, size_t sample);
XIP_XILINX_XIP_IMPEXP const xip_status xip_cordic_v6_0_xip_array_complex_get_data(const xip_array_complex* p, xip_complex* value, size_t sample);

/**
 * Fill in a configuration structure with the core's default values.
 *
 * @param     config     The configuration structure to be populated
 * @returns   Exit code  XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_default_config(xip_cordic_v6_0_config *config);

/**
 * Get version of model.
 *
 * @returns   String  Textual representation of model version
 */
XIP_XILINX_XIP_IMPEXP
const char* xip_cordic_v6_0_get_version(void);

/**
 * Create a new instance of the core based on some configuration values.
 *
 * @param     config      Pointer to a xip_cordic_v6_0_config structure
 * @param     handler     Callback function for errors and warnings (providing a null
 *                        pointer means no messages are output)
 * @param     handle      Optional argument to be passed back to callback function
 *
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
xip_cordic_v6_0 *xip_cordic_v6_0_create(
  const xip_cordic_v6_0_config *config,
  xip_msg_handler              handler,
  void                         *handle
);

/**
 * Execute the model.
 *
 * @param     s        Pointer to xip_cordic_v6_0 state structure
 * @param     fn       Function to perform.
 * @param     xin      Pointer to array structure of X inputs
 * @param     phasein  Pointer to array structure of Phase inputs
 * @param     cartin   Pointer to array structure of Cartesian (X & Y) inputs
 * @param     xout     Pointer to array structure of X outputs
 * @param     phaseout Pointer to array structure of Phase outputs
 * @param     cartout  Pointer to array structure of Cartesian (X & Y) outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_data_do(
    xip_cordic_v6_0   *s,
    xip_uint          fn,
    xip_array_real    *magin,
    xip_array_real    *phasein,
    xip_array_complex *cartin,
    xip_array_real    *magout,
    xip_array_real    *phaseout,
    xip_array_complex *cartout,
    size_t            samples
  );

/**
 * Execute the rotate function.
 *
 * @param     s       Pointer to xip_cordic_v6_0 state structure
 * @param     cartin  Pointer to array structure of Cartesian (X & Y) inputs
 * @param     phasein Pointer to array structure of Phase inputs
 * @param     cartout Pointer to array structure of Cartesian (X & Y) outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_rotate(
    xip_cordic_v6_0   *s,
    xip_array_complex *cartin,
    xip_array_real    *phasein,
    xip_array_complex *cartout,
    size_t            samples
  );

/**
 * Execute the translate function.
 *
 * @param     s        Pointer to xip_cordic_v6_0 state structure
 * @param     cartin   Pointer to array structure of Cartesian (X & Y) inputs
 * @param     magout   Pointer to array structure of X outputs
 * @param     phaseout Pointer to array structure of Phase outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_translate(
    xip_cordic_v6_0   *s,
    xip_array_complex *cartin,
    xip_array_real    *magout,
    xip_array_real    *phaseout,
    size_t            samples
  );

/**
 * Execute the Sin and Cos function.
 *
 * @param     s       Pointer to xip_cordic_v6_0 state structure
 * @param     phasein Pointer to array structure of Phase inputs
 * @param     cartout Pointer to array structure of Cartesian (X & Y) outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_sin_cos(
    xip_cordic_v6_0   *s,
    xip_array_real    *phasein,
    xip_array_complex *cartout,
    size_t            samples
  );

/**
 * Execute the arctan function.
 *
 * @param     s        Pointer to xip_cordic_v6_0 state structure
 * @param     cartin   Pointer to array structure of Cartesian (X & Y) inputs
 * @param     phaseout Pointer to array structure of Phase outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_atan(
    xip_cordic_v6_0   *s,
    xip_array_complex *cartin,
    xip_array_real    *phaseout,
    size_t            samples
  );

/**
 * Execute the hyperbolic Sin and Cos function.
 *
 * @param     s       Pointer to xip_cordic_v6_0 state structure
 * @param     phasein Pointer to array structure of Phase inputs
 * @param     cartout Pointer to array structure of Cartesian (X & Y) outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_sinh_cosh(
    xip_cordic_v6_0   *s,
    xip_array_real    *phasein,
    xip_array_complex *cartout,
    size_t            samples
  );

/**
 * Execute the hyperbolic arctan function.
 *
 * @param     s        Pointer to xip_cordic_v6_0 state structure
 * @param     cartin   Pointer to array structure of Cartesian (X & Y) inputs
 * @param     phaseout Pointer to array structure of Phase outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_atanh(
    xip_cordic_v6_0   *s,
    xip_array_complex *cartin,
    xip_array_real    *phaseout,
    size_t            samples
  );

/**
 * Execute the square root function.
 *
 * @param     s        Pointer to xip_cordic_v6_0 state structure
 * @param     cartin   Pointer to array structure of Cartesian (X & Y) inputs
 * @param     phaseout Pointer to array structure of Phase outputs
 * @returns   Exit code   XIP_STATUS_*
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_sqrt(
    xip_cordic_v6_0   *s,
    xip_array_real    *magin,
    xip_array_real    *magout,
    size_t            samples
  );

/**
 * Destroy an instance of the core and free any resources allocated.
 *
 * @param     s           Pointer to xip_cordic_v6_0 state structure
 * @returns   Exit code   XIP_STATUS_*
 *
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_destroy(
  xip_cordic_v6_0 *s
  );

/**
 * Fill a configuration structure with the core's current state
 */
XIP_XILINX_XIP_IMPEXP
const xip_status xip_cordic_v6_0_get_config(
  xip_cordic_v6_0        *s,
  xip_cordic_v6_0_config *config
  );


#ifdef __cplusplus
}
#endif

#endif
