#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /data/skamat/Ales_Vivado/HLS/MET_TRIAL/solution1/.autopilot/db/a.g.bc ${1+"$@"}
