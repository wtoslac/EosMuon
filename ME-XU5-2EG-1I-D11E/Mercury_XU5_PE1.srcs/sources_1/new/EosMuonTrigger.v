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
 
    // The top (top layer on top of the water tank) paddles has 10 channels make them IOA[9:0] 
    assign TopHit = |IOA[3:0]; // |IOA[9:0];// OR reduction operator
    assign LED[0] = ~TopHit;
    
    // The mid (bottom layer on top of the water tank) paddles has 20 channels make them IOA[25:10] (16-ch) , IOB[3:0] 
    assign MidHit = (|IOA[25:10]) | (|IOB[3:0]); // |IOA[9:0];// OR reduction operator
    assign LED[1] = ~MidHit;
    
    // The btm (below the water tank) paddle has 22 channels, IOB[25:4]
    assign BtmHit = |IOB[25:4];
    assign LED[2] = ~BtmHit;
    
    // The barrel have up to 40 paddles (80 ch), but currently there are 38 paddles (76 ch).
    // I will use all 72 FMCs and 8 channels from IOCs for the barrel
    assign BarHit = (|FMCN[25:10]) | (|FMCP[3:0]) | (|IOC[7:0]);
    // no LED readout available for this yet.
    // Looking into the MERCURY_XU5_PE1.tcl file. 
    // Only LED*_N_PL, where * = 1,2,3 are mapped.
    // So what's LED0_N_PL for??
    
   
    
    
    
    //wire Clk1Hz;
    //SlowClock SlowClock_i(Clk100,Clk1Hz);
    //always @(posedge Clk1Hz) begin
    
    /*
        for (i = 0; i < 8; i = i + 1) begin
           if (IOA[i]) 
            nHits = nHits + 1;
        end
    end
     
    assign LED[0] = ~nHits[0];
    assign LED[1] = ~nHits[1];
    assign LED[2] = ~nHits[2];
    */
    
/*   
    integer i; 
    reg [6:0] nHits; 
    always @(*) begin
        nHits = 0;       
        for (i = 0; i < 35; i = i + 1) begin
            if (FMCN[i])
                nHits = nHits + 1;
            if (FMCP[i])
                nHits = nHits + 1;
            if (i < 25) begin
                if (IOA[i])
                    nHits = nHits + 1;
                if (IOB[i])
                    nHits = nHits + 1;
            end
            if(i < 7) begin
                if (IOD[i])
                    nHits = nHits + 1;
            end         
        end
    end
    assign LED[0] = ~nHits[0]; // Single Hit
    assign LED[1] = ~nHits[1]; // Double Hits
    assign LED[2] = (~nHits[0] & ~nHits[1]); //Triple Hits
*/
    //assign IOC[0] = ~nHits[0];
    //assign IOC[1] = ~nHits[1];
    //assign IOC[2] = ~nHits[2];
    //assign LED[0] = ~nHits[0];
    //assign LED[1] = ~nHits[1];
    //assign LED[2] = ~nHits[2];
    //assign IOC[3] = Clk1Hz;
    //assign IOC[4] = ~Clk1Hz;//IOA[17];//nHits[1]; 
    //assign LED[0] = Clk1Hz; //nHits[1];
    //assign LED[1] = ~Clk1Hz; //nHits[1];
    
endmodule
/*
module SlowClock(
    input Clk100,     // 100 MHz input clock
    output reg Clk1Hz    // 1 Hz output clock
    );   
    // Declare a counter variable to divide the clock
    reg [26:0] counter;  // 27 bits are enough to count up to 100,000,000

    // Always block to handle clock division
    always @(posedge Clk100) begin
        if (counter == 50_000_000) begin
            counter <= 0;
            Clk1Hz <= ~Clk1Hz;  // Toggle the 1 Hz clock
        end 
        else begin
            counter <= counter + 1;  // Increment counter
        end
    end
endmodule
*/