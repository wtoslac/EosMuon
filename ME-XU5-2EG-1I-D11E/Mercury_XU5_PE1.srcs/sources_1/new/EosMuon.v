`timescale 1ns / 1ps

module EosMuon(
    input Clk50,
    input Clk100,
    output [2:0] LEDS,
    input [25:0] IOA,
    input [25:0] IOB,
    input [35:0] FMCN,
    input [35:0] FMCP,  
    output [7:0] IOC,
    // PS accessible bits 32x64.
    output [2047:0] reg_ro_out
    );
    //assign LED3 = A0; //1'b1;//IOB_D23_SC7_BTN3_N;
    //assign LED2 = A1;//1'b0;
    //assign C0 = A0 & A1;
   // assign D22 = 1'b0;
   // assign D20 = 1'b1;
   // assign D18 = 1'bz;
   /*reg [26:0] count=0; //Max is 134M     
   always @(posedge Clk50) begin // 50MHz Clk
        count<=count+1;
        // The MSB should blink every 2.5 seconds (27-bits)
   end*/
   reg [31:0] count=0; //Max is 4.3B
   always @(posedge Clk100) begin // 50MHz Clk
        count<=count+1;
        // The MSB should blink every 43 seconds (32-bits)
   end
   
   assign IOC[7:0]=8'b10101010;
   //assign reg_ro_out [ 0 * 32 +  31 : 0 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 0 * 32 +  31 : 0 * 32 +  0] = count[31:0];
   assign reg_ro_out [ 1 * 32 + 7 : 1 * 32 + 0 ] = IOC[7:0];
   assign reg_ro_out [ 1 * 32 + 31 : 1 * 32 + 8 ] = 0;
   assign reg_ro_out [ 2 * 32 + 25 : 2 * 32 + 0 ] = IOA;
   assign reg_ro_out [ 2 * 32 + 31 : 2 * 32 + 26 ] = 0;
   assign reg_ro_out [ 3 * 32 + 25 : 3 * 32 + 0 ] = IOB;
   assign reg_ro_out [ 3 * 32 + 31 : 3 * 32 + 26 ] = 0;
   assign reg_ro_out [ 4 * 32 + 31 : 4 * 32 + 0 ] = FMCN;
   assign reg_ro_out [ 5 * 32 + 31 : 5 * 32 + 0 ] = FMCP;
   assign reg_ro_out [ 63 * 32 +  31 : 63 * 32 +  0] = 32'hdeadbeef;
   assign LEDS[0] = count[29];
   assign LEDS[1] = count[28];
   assign LEDS[2] = count[27]; // MSB
   
endmodule
