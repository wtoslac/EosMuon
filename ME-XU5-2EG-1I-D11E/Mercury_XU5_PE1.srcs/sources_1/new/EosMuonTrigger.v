`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/20/2025 12:33:10 PM
// Design Name: 
// Module Name: EosMuonTrigger
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EosMuonTrigger(
    //input Clk50,
    input Clk100,
    output [2:0] LED,
    input [25:0] IOA,
    input [25:0] IOB,
    input [35:0] FMCN,
    input [35:0] FMCP,  
    inout [7:0] IOC,
    inout [6:0] IOD,
    input IOD7
    );
    /******************** Testing Combo Cards ******************************
    //assign IOA[20] = ~IOA[22];
    //assign IOA[16] = ~IOA[18];
    //assign IOA[14] = ~(IOA[22] & IOA[18]);
    // IO Test with Arran on the FMC Adapater March 7th 2025
    //assign IOA[20] = ~FMCP[0]; //PIN 1 on Box
    //assign IOA[16] = ~FMCN[3];  // Pin 15 on Box
    //assign IOA[14] = !FMCP[0] & !FMCN[3];
    //assign LED[0] = ~ IOA[0];
    //assign LED[1] = ~ IOA[1];
    //assign LED[2] = ~ (IOA[2] | IOA[3]);
     
    //******************** Testing Combo Cards ******************************/
    //******************** Testing Combo Cards 2 ******************************
    assign IOD[4] = FMCP[0]; // IOD[4] is the bottom right LEMO00 Connector
    assign IOD[5] = FMCN[0]; // IOD[5] is the Top right LEMO00 Connector
    
    //******************** Testing Combo Cards 2 ******************************/   
    /******************** Testing with PTB ******************************
    //wire Clk100Hz;
    //wire Clk2Hz;
    wire pulse500ns_2Hz;
    //SlowClock100Hz SlowClock100Hz_i(Clk100,Clk100Hz);
    //SlowClock2Hz SlowClock2Hz_i(Clk100,Clk2Hz);
    Pulse500ns_2Hz Pulse500ns_2Hz_i(Clk100, pulse500ns_2Hz);  
    assign IOC[7] = IOD7; // Pass the input through to IOC[7]
    assign IOD[4] = pulse500ns_2Hz; // SMA Top Right is an output to the PTB
    assign IOD[5] = pulse500ns_2Hz; // SMA Top Right is an output to the PTB
    //******************** Testing with PTB ******************************/
    
    /******************* Paddle Trigger Codes ******************************
    wire TopHit, MidHit, BtmHit, BarHit, TripleHits, TopMidOnlyHits;
    // The top (top layer on top of the water tank) paddles has 10 channels make them IOA[9:0] 
    assign TopHit = |(~IOA[9:0]);// OR reduction operator
    assign TopHit = |(~IOA[3:0]); // Limit to 4 ch for easy testing.
    assign LED[0] = ~TopHit;
    
    // The mid (bottom layer on top of the water tank) paddles has 20 channels make them IOA[25:10] (16-ch) , IOB[3:0] 
    assign MidHit = (|(~IOA[25:10])) | (|(~IOB[3:0])); // |IOA[9:0];// OR reduction operator
    assign LED[1] = ~MidHit;
    
    // The btm (below the water tank) paddle has 22 channels, IOB[25:4]
    assign BtmHit = |(~IOB[25:4]);
    assign LED[2] = ~BtmHit;
    
    // The barrel have up to 40 paddles (80 ch), but currently there are 38 paddles (76 ch).
    // I will use all 72 FMCs and 8 channels from IOCs for the barrel
    assign BarHit = (|(~FMCN[25:10])) | ((~|FMCP[3:0])) | (|(~IOC[7:0]));
    // no LED readout available for this yet.
    // Looking into the MERCURY_XU5_PE1.tcl file. 
    // Only LED*_N_PL, where * = 1,2,3 are mapped.
    // So what's LED0_N_PL for??  
    assign TripleHits = (TopHit & MidHit & BtmHit) | (TopHit & MidHit & BarHit);
    assign TopMidOnlyHits = TopHit & MidHit & (~BtmHit & ~BarHit);
    
    //******************** Paddle Trigger Codes ******************************/
endmodule

module SlowClock100Hz(
     input Clk100,     // 100 MHz input clock
     output reg Clk100Hz    // 1 Hz output clock
     );   
     // Declare a counter variable to divide the clock
     reg [26:0] counter;  // 27 bits are enough to count up to 100,000,000
 
     // Always block to handle clock division
     always @(posedge Clk100) begin
         if (counter == 500_000) begin
             counter <= 0;
             Clk100Hz <= ~Clk100Hz;  // Toggle the 1 Hz clock
         end 
         else begin
             counter <= counter + 1;  // Increment counter
         end
     end
 endmodule
 /*
 module SlowClock2Hz(
     input Clk100,     // 100 MHz input clock
     output reg Clk2Hz    // 2 Hz output clock
     );   
     // Declare a counter variable to divide the clock
     reg [26:0] counter;  // 27 bits are enough to count up to 100,000,000
 
     // Always block to handle clock division
     always @(posedge Clk100) begin
         if (counter == 25_000_000) begin
             counter <= 0;
             Clk2Hz <= ~Clk2Hz;  // Toggle the 2 Hz clock
         end 
         else begin
             counter <= counter + 1;  // Increment counter
         end
     end
 endmodule
 */
 module Pulse500ns_2Hz(
    input Clk100,      // 100 MHz input clock
    output reg Pulse   // Output pulse
);
    reg [25:0] counter;  // 26-bit counter (counts up to 50M)
    
    always @(posedge Clk100) begin
        if (counter == 50_000_000 - 1) begin
            counter <= 0;
            Pulse <= 1;
        end 
        else if (counter == 50) begin
            Pulse <= 0; // End pulse after 500 ns (50 cycles)
            counter <= counter + 1;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule