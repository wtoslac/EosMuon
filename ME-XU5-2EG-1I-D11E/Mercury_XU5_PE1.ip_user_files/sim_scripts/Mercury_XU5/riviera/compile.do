vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_13
vlib riviera/zynq_ultra_ps_e_vip_v1_0_13
vlib riviera/xil_defaultlib
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_29
vlib riviera/microblaze_v11_0_10
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/lmb_v10_v3_0_12
vlib riviera/lmb_bram_if_cntlr_v4_0_21
vlib riviera/blk_mem_gen_v8_4_5
vlib riviera/iomodule_v3_1_8
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_27
vlib riviera/fifo_generator_v13_2_7
vlib riviera/axi_data_fifo_v2_1_26
vlib riviera/axi_crossbar_v2_1_28
vlib riviera/xlconstant_v1_1_7
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_converter_v2_1_27
vlib riviera/axi_clock_converter_v2_1_26
vlib riviera/axi_dwidth_converter_v2_1_27

vmap xilinx_vip riviera/xilinx_vip
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_13 riviera/axi_vip_v1_1_13
vmap zynq_ultra_ps_e_vip_v1_0_13 riviera/zynq_ultra_ps_e_vip_v1_0_13
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_29 riviera/axi_gpio_v2_0_29
vmap microblaze_v11_0_10 riviera/microblaze_v11_0_10
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap lmb_v10_v3_0_12 riviera/lmb_v10_v3_0_12
vmap lmb_bram_if_cntlr_v4_0_21 riviera/lmb_bram_if_cntlr_v4_0_21
vmap blk_mem_gen_v8_4_5 riviera/blk_mem_gen_v8_4_5
vmap iomodule_v3_1_8 riviera/iomodule_v3_1_8
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_27 riviera/axi_register_slice_v2_1_27
vmap fifo_generator_v13_2_7 riviera/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_26 riviera/axi_data_fifo_v2_1_26
vmap axi_crossbar_v2_1_28 riviera/axi_crossbar_v2_1_28
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_converter_v2_1_27 riviera/axi_protocol_converter_v2_1_27
vmap axi_clock_converter_v2_1_26 riviera/axi_clock_converter_v2_1_26
vmap axi_dwidth_converter_v2_1_27 riviera/axi_dwidth_converter_v2_1_27

vlog -work xilinx_vip  -sv2k12 "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"/home/wto/Programs/Vivado/2022.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/home/wto/Programs/Vivado/2022.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"/home/wto/Programs/Vivado/2022.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"/home/wto/Programs/Vivado/2022.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_13  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ffc2/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_13  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_zynq_ultra_ps_e_0/sim/Mercury_XU5_zynq_ultra_ps_e_0_vip_wrapper.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_conv_funs_pkg.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/common_types_pkg.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_proc_common_pkg.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_ipif_pkg.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_family_support.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_family.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_soft_reset.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/proc_common_v3_00_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_pselect_f.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/axi_lite_ipif_v1_31_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_address_decoder.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/axi_lite_ipif_v1_31_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_slave_attachment.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/interrupt_control_v2_01_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_interrupt_control.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/axi_lite_ipif_v1_31_a/hdl/src/vhdl/Mercury_XU5_system_management_wiz_0_axi_lite_ipif.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/Mercury_XU5_system_management_wiz_0_xadc_core_drp.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/Mercury_XU5_system_management_wiz_0_axi_xadc.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_system_management_wiz_0/Mercury_XU5_system_management_wiz_0.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_29 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/6219/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_led_0/sim/Mercury_XU5_led_0.vhd" \

vcom -work microblaze_v11_0_10 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/1f7b/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_0/sim/bd_8825_microblaze_I_0.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_1/sim/bd_8825_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_12 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/cd1d/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_2/sim/bd_8825_ilmb_0.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_3/sim/bd_8825_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_21 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/a177/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_4/sim/bd_8825_dlmb_cntlr_0.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_5/sim/bd_8825_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_5  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_6/sim/bd_8825_lmb_bram_I_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_7/sim/bd_8825_second_dlmb_cntlr_0.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_8/sim/bd_8825_second_ilmb_cntlr_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_9/sim/bd_8825_second_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_8 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/b8f2/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/ip/ip_10/sim/bd_8825_iomodule_0_0.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/bd_0/sim/bd_8825.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_0/sim/Mercury_XU5_ddr4_0_microblaze_mcs.vhd" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/phy/Mercury_XU5_ddr4_0_phy_ddr4.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy_behav.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/phy/ddr4_phy_v2_2_xiphy.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob_byte.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/iob/ddr4_phy_v2_2_iob.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/clocking/ddr4_phy_v2_2_pll.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_tristate_wrapper.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_riuor_wrapper.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_control_wrapper.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_byte_wrapper.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/xiphy_files/ddr4_phy_v2_2_xiphy_bitslice_wrapper.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/ip_top/Mercury_XU5_ddr4_0_phy.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_wtr.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ref.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_rd_wr.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_periodic.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_group.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_merge_enc.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_gen.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_fi_xor.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_dec_fix.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc_buf.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ecc.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_ctl.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_c.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_cmd_mux_ap.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_p.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_mux_p.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_c.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_arb_a.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_act_timer.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc_act_rank.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/controller/ddr4_v2_2_mc.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ui/ddr4_v2_2_ui_wr_data.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ui/ddr4_v2_2_ui_rd_data.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ui/ddr4_v2_2_ui_cmd.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ui/ddr4_v2_2_ui.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_ar_channel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_aw_channel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_b_channel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_arbiter.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_fsm.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_cmd_translator.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_fifo.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_incr_cmd.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_r_channel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_w_channel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_wr_cmd_fsm.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_wrap_cmd.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_a_upsizer.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_register_slice.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axi_upsizer.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_axic_register_slice.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_carry_and.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_and.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_carry_latch_or.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_carry_or.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_command_fifo.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_comparator.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_comparator_sel_static.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_r_upsizer.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi/ddr4_v2_2_w_upsizer.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_addr_decode.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_read.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg_bank.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_reg.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_top.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/axi_ctrl/ddr4_v2_2_axi_ctrl_write.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/clocking/ddr4_v2_2_infrastructure.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_bram.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_write.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_byte.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_wr_bit.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_sync.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_read.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_rd_en.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_pi.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_mc_odt.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_debug_microblaze.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx_data.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_cplx.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_config_rom.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_addr_decode.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_top.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal_xsdb_arbiter.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_cal.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_chipscope_xsdb_slave.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/ddr4_v2_2_dp_AB9.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top/Mercury_XU5_ddr4_0_ddr4.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top/Mercury_XU5_ddr4_0_ddr4_mem_intfc.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal/Mercury_XU5_ddr4_0_ddr4_cal_riu.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top/Mercury_XU5_ddr4_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/tb/Mercury_XU5_ddr4_0_microblaze_mcs_0.sv" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_27  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b4/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -93  \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_26  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/3111/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_28  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/c40e/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_xbar_0/sim/Mercury_XU5_xbar_0.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_clk_wiz_0_0/Mercury_XU5_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_clk_wiz_0_0/Mercury_XU5_clk_wiz_0_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ps_sys_rst_0/sim/Mercury_XU5_ps_sys_rst_0.vhd" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_sys_rst_0/sim/Mercury_XU5_ddr4_sys_rst_0.vhd" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/badb/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_0/sim/bd_3ad7_one_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_1/sim/bd_3ad7_psr_aclk_0.vhd" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/sc_util_v1_0_vl_rfs.sv" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/c012/hdl/sc_switchboard_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_2/sim/bd_3ad7_arinsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_3/sim/bd_3ad7_rinsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_4/sim/bd_3ad7_awinsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_5/sim/bd_3ad7_winsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_6/sim/bd_3ad7_binsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_7/sim/bd_3ad7_aroutsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_8/sim/bd_3ad7_routsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_9/sim/bd_3ad7_awoutsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_10/sim/bd_3ad7_woutsw_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_11/sim/bd_3ad7_boutsw_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/sc_node_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_12/sim/bd_3ad7_arni_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_13/sim/bd_3ad7_rni_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_14/sim/bd_3ad7_awni_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_15/sim/bd_3ad7_wni_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_16/sim/bd_3ad7_bni_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/be1f/hdl/sc_mmu_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_17/sim/bd_3ad7_s00mmu_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/4fd2/hdl/sc_transaction_regulator_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_18/sim/bd_3ad7_s00tr_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/637d/hdl/sc_si_converter_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_19/sim/bd_3ad7_s00sic_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f38e/hdl/sc_axi2sc_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_20/sim/bd_3ad7_s00a2s_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_21/sim/bd_3ad7_sarn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_22/sim/bd_3ad7_srn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_23/sim/bd_3ad7_sawn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_24/sim/bd_3ad7_swn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_25/sim/bd_3ad7_sbn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/9cc5/hdl/sc_sc2axi_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_26/sim/bd_3ad7_m00s2a_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_27/sim/bd_3ad7_m00arn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_28/sim/bd_3ad7_m00rn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_29/sim/bd_3ad7_m00awn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_30/sim/bd_3ad7_m00wn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_31/sim/bd_3ad7_m00bn_0.sv" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/6bba/hdl/sc_exit_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_32/sim/bd_3ad7_m00e_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_33/sim/bd_3ad7_m01s2a_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_34/sim/bd_3ad7_m01arn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_35/sim/bd_3ad7_m01rn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_36/sim/bd_3ad7_m01awn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_37/sim/bd_3ad7_m01wn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_38/sim/bd_3ad7_m01bn_0.sv" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/ip/ip_39/sim/bd_3ad7_m01e_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/bd_0/sim/bd_3ad7.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_smartconnect_00_0/sim/Mercury_XU5_smartconnect_00_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_reg_bank_v1_0_0_1/sim/Mercury_XU5_reg_bank_v1_0_0_1.vhd" \

vlog -work axi_protocol_converter_v2_1_27  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/aeb3/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_26  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/b8be/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work axi_dwidth_converter_v2_1_27  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/4675/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/ec67/hdl" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/abef/hdl" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/7698" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/f0b6/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ipshared/66be/hdl/verilog" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/ip_1/rtl/map" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/ip_top" "+incdir+../../../../Mercury_XU5_PE1.gen/sources_1/bd/Mercury_XU5/ip/Mercury_XU5_ddr4_0/rtl/cal" "+incdir+/home/wto/Programs/Vivado/2022.2/data/xilinx_vip/include" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_auto_ds_0/sim/Mercury_XU5_auto_ds_0.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_auto_pc_0/sim/Mercury_XU5_auto_pc_0.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_auto_rs_0/sim/Mercury_XU5_auto_rs_0.v" \
"../../../bd/Mercury_XU5/ip/Mercury_XU5_auto_rs_w_0/sim/Mercury_XU5_auto_rs_w_0.v" \

vcom -work xil_defaultlib -93  \
"../../../bd/Mercury_XU5/sim/Mercury_XU5.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

