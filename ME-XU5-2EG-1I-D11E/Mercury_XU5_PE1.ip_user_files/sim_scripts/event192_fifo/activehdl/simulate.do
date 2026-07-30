onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+event192_fifo  -L xilinx_vip -L xpm -L fifo_generator_v13_2_7 -L xil_defaultlib -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.event192_fifo xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {event192_fifo.udo}

run

endsim

quit -force
