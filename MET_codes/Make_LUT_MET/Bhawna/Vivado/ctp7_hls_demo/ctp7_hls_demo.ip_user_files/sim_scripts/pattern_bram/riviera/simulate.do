onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+pattern_bram -L xil_defaultlib -L xpm -L blk_mem_gen_v8_3_5 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.pattern_bram xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {pattern_bram.udo}

run -all

endsim

quit -force
