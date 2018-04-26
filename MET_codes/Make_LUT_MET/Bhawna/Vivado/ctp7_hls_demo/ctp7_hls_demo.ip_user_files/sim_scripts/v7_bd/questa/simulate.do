onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib v7_bd_opt

do {wave.do}

view wave
view structure
view signals

do {v7_bd.udo}

run -all

quit -force
