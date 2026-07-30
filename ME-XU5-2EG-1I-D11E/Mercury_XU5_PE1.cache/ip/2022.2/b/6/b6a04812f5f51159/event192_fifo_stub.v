// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue Jun 23 16:30:33 2026
// Host        : precision3561 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ event192_fifo_stub.v
// Design      : event192_fifo
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu2eg-sfvc784-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_7,Vivado 2022.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, srst, din, wr_en, rd_en, dout, full, overflow, 
  empty, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[191:0],wr_en,rd_en,dout[191:0],full,overflow,empty,wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [191:0]din;
  input wr_en;
  input rd_en;
  output [191:0]dout;
  output full;
  output overflow;
  output empty;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
