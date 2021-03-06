#ifndef sineLUTs_h
#define sineLUTs_h
#include <stdint.h>
#include <ap_fixed.h>
static const ap_fixed<4,1> sineLUT[18][4]{
{ 0.1, 0.1, 0.3, 0.4},
{ 0.4, 0.5, 0.5, 0.6},
{ 0.6, 0.8, 0.8, 0.9},
{ 0.9, 0.9, 0.9, 0.9},
{ 0.9, 0.9, 0.9, 0.9},
{ 0.9, 0.9, 0.9, 0.8},
{ 0.8, 0.6, 0.6, 0.5},
{ 0.5, 0.4, 0.4, 0.3},
{ 0.1, 0.1,   0,-0.1},
{-0.3,-0.3,-0.4,-0.5},
{-0.5,-0.6,-0.6,-0.8},
{-0.8,-0.9,-0.9,  -1},
{  -1,  -1,  -1,  -1},
{  -1,  -1,  -1,  -1},
{  -1,  -1,  -1,-0.9},
{-0.9,-0.8,-0.8,-0.6},
{-0.6,-0.5,-0.5,-0.4},
{-0.3,-0.3,-0.1,   0}
};
#endif