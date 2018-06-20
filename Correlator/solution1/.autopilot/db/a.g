#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /data/skamat/Github/VivadoHLS/Correlator/solution1/.autopilot/db/a.g.bc ${1+"$@"}
