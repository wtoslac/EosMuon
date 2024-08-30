# eos/Muon

Previously
I was able to use the Mercury_XU5_PE1 reference design to setup the SoC. The code was written in VHDL. After trying to convert the VHDL to Verilog, it caused other errors in the bitstream because some of the IOs was not able usable in verilog. I made a EosMuon.v which can be instantiated in VHDL instead. I was able to turn the LED on and off using the EosMuon.v.

8/30/2024
I am use EosMuon.v to set some IO high and low to see what happens.

I added D22, D20, D18 and set those values to 1b'0, 1b'1, 1b'z. The outputs are 0, 1.8V, 0 respectively after programming the FPGA on Vitis.


