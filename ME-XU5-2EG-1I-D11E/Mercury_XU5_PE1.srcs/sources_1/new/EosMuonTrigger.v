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
    inout [25:0] IOA,
    inout [25:0] IOB,
    inout [35:0] FMCN,
    inout [35:0] FMCP,  
    inout [7:0] IOC,
    inout [7:0] IOD
    );
    // IO Test with Arran March 7th 2025
    //assign IOA[20] = ~IOA[22];
    //assign IOA[16] = ~IOA[18];
    //assign IOA[14] = ~(IOA[22] & IOA[18]);
    // IO Test with Arran on the FMC Adapater March 7th 2025
    //assign IOA[20] = ~FMCP[0]; //PIN 1 on Box
    //assign IOA[16] = ~FMCN[3];  // Pin 15 on Box
    //assign IOA[14] = !FMCP[0] & !FMCN[3];
    
    wire TopHit, MidHit, BtmHit, BarHit, TripleHits, TopMidOnlyHits;
    // The top (top layer on top of the water tank) paddles has 10 channels make them IOA[9:0] 
    //assign TopHit = |(~IOA[9:0]);// OR reduction operator
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
   
endmodule