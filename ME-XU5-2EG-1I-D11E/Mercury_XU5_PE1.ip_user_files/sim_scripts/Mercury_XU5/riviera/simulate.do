onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+Mercury_XU5  -L xilinx_vip -L xpm -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_13 -L zynq_ultra_ps_e_vip_v1_0_13 -L xil_defaultlib -L axi_lite_ipif_v3_0_4 -L lib_cdc_v1_0_2 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_29 -L microblaze_v11_0_10 -L proc_sys_reset_v5_0_13 -L lmb_v10_v3_0_12 -L lmb_bram_if_cntlr_v4_0_21 -L blk_mem_gen_v8_4_5 -L iomodule_v3_1_8 -L generic_baseblocks_v2_1_0 -L axi_register_slice_v2_1_27 -L fifo_generator_v13_2_7 -L axi_data_fifo_v2_1_26 -L axi_crossbar_v2_1_28 -L xlconstant_v1_1_7 -L smartconnect_v1_0 -L axi_protocol_converter_v2_1_27 -L axi_clock_converter_v2_1_26 -L axi_dwidth_converter_v2_1_27 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Mercury_XU5 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {Mercury_XU5.udo}

run 1000ns

endsim

quit -force
