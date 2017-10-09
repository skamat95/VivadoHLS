onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Make_LUT_MET_0_opt

do {wave.do}

view wave
view structure
view signals

do {Make_LUT_MET_0.udo}

run -all

quit -force
