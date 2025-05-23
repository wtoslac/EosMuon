`timescale 1ns / 1ps

module EosMuonDAQ(
    input Clk50,
    input Clk100,
    output [2:0] LED,
    input [25:0] IOA,
    input [25:0] IOB,
    input [35:0] FMCN,
    input [35:0] FMCP,  
    input [7:0] IOC,
    inout [6:0] IOD,
    input IOD7,
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
   
   
   //assign IOC[7:0]=8'b10101010; // this will convert to 0xaa in hex.
   assign reg_ro_out [ 31+32*0 : 0+32*0] = 32'hdeadbeef; //this goes to 0x8002_0100
   
   wire Clk2Hz;
   SlowClock2Hz SlowClock2Hz_i(Clk100,Clk2Hz);
   reg [31:0] nClk2Hz=0; //Max is 4.3B
   always @(posedge Clk2Hz) begin // 2Hz Clk
        nClk2Hz<=nClk2Hz+1; // 
   end
   assign reg_ro_out [31+32*1:0+32*1] = nClk2Hz[31:0];  //this goes to 0x8002_0104 (4Hex=32bit address later)  

    //******************** Testing with Paddles by counting hits from them ******************************
     // Synchronizers for FMCP and FMCN signals
    reg [1:0] fmcp0_sync = 2'b11;
    reg [1:0] fmcp5_sync = 2'b11;
    reg [1:0] fmcp6_sync = 2'b11;
    reg [1:0] fmcp7_sync = 2'b11;
    reg [1:0] fmcp8_sync = 2'b11;
    reg [1:0] fmcp9_sync = 2'b11;
    reg [1:0] fmcp19_sync = 2'b11;
    reg [1:0] fmcp18_sync = 2'b11;
    reg [1:0] fmcp17_sync = 2'b11;
    reg [1:0] fmcp16_sync = 2'b11;
    reg [1:0] fmcp15_sync = 2'b11;
    reg [1:0] fmcn0_sync = 2'b11;
    reg [1:0] fmcn5_sync = 2'b11;
    reg [1:0] fmcn6_sync = 2'b11;
    reg [1:0] fmcn7_sync = 2'b11;
    reg [1:0] fmcn8_sync = 2'b11;
    reg [1:0] fmcn9_sync = 2'b11;
    reg [1:0] fmcn19_sync = 2'b11;
    reg [1:0] fmcn18_sync = 2'b11;
    reg [1:0] fmcn17_sync = 2'b11;
    reg [1:0] fmcn16_sync = 2'b11;
    reg [1:0] fmcn15_sync = 2'b11;
    
    // Pulse wires
    wire FMCP0Pulse, FMCP5Pulse, FMCP6Pulse, FMCP7Pulse, FMCP8Pulse, FMCP9Pulse, FMCP19Pulse, FMCP18Pulse, FMCP17Pulse, FMCP16Pulse, FMCP15Pulse;
    wire FMCN0Pulse, FMCN5Pulse, FMCN6Pulse, FMCN7Pulse, FMCN8Pulse, FMCN9Pulse, FMCN19Pulse, FMCN18Pulse, FMCN17Pulse, FMCN16Pulse, FMCN15Pulse;
    
    // Synchronize inputs to system clock
    always @(posedge Clk100) begin
        fmcp0_sync <= {fmcp0_sync[0], FMCP[0]};
        fmcp5_sync <= {fmcp5_sync[0], FMCP[5]};
        fmcp6_sync <= {fmcp6_sync[0], FMCP[6]};
        fmcp7_sync <= {fmcp7_sync[0], FMCP[7]};
        fmcp8_sync <= {fmcp8_sync[0], FMCP[8]};
        fmcp9_sync <= {fmcp9_sync[0], FMCP[9]};
        fmcp19_sync <= {fmcp19_sync[0], FMCP[19]};
        fmcp18_sync <= {fmcp18_sync[0], FMCP[18]};
        fmcp17_sync <= {fmcp17_sync[0], FMCP[17]};
        fmcp16_sync <= {fmcp16_sync[0], FMCP[16]};
        fmcp15_sync <= {fmcp15_sync[0], FMCP[15]};
        fmcn0_sync <= {fmcn0_sync[0], FMCN[0]};
        fmcn5_sync <= {fmcn5_sync[0], FMCN[5]};
        fmcn6_sync <= {fmcn6_sync[0], FMCN[6]};
        fmcn7_sync <= {fmcn7_sync[0], FMCN[7]};
        fmcn8_sync <= {fmcn8_sync[0], FMCN[8]};
        fmcn9_sync <= {fmcn9_sync[0], FMCN[9]};
        fmcn19_sync <= {fmcn19_sync[0], FMCN[19]};
        fmcn18_sync <= {fmcn18_sync[0], FMCN[18]};
        fmcn17_sync <= {fmcn17_sync[0], FMCN[17]};
        fmcn16_sync <= {fmcn16_sync[0], FMCN[16]};
        fmcn15_sync <= {fmcn15_sync[0], FMCN[15]};
    end
    
    // Falling edge detection
    assign FMCP0Pulse = (fmcp0_sync[1] & ~fmcp0_sync[0]);
    assign FMCP5Pulse = (fmcp5_sync[1] & ~fmcp5_sync[0]);
    assign FMCP6Pulse = (fmcp6_sync[1] & ~fmcp6_sync[0]);
    assign FMCP7Pulse = (fmcp7_sync[1] & ~fmcp7_sync[0]);
    assign FMCP8Pulse = (fmcp8_sync[1] & ~fmcp8_sync[0]);
    assign FMCP9Pulse = (fmcp9_sync[1] & ~fmcp9_sync[0]);
    assign FMCP19Pulse = (fmcp19_sync[1] & ~fmcp19_sync[0]);
    assign FMCP18Pulse = (fmcp18_sync[1] & ~fmcp18_sync[0]);
    assign FMCP17Pulse = (fmcp17_sync[1] & ~fmcp17_sync[0]);
    assign FMCP16Pulse = (fmcp16_sync[1] & ~fmcp16_sync[0]);
    assign FMCP15Pulse = (fmcp15_sync[1] & ~fmcp15_sync[0]);
    assign FMCN0Pulse = (fmcn0_sync[1] & ~fmcn0_sync[0]);
    assign FMCN5Pulse = (fmcn5_sync[1] & ~fmcn5_sync[0]);
    assign FMCN6Pulse = (fmcn6_sync[1] & ~fmcn6_sync[0]);
    assign FMCN7Pulse = (fmcn7_sync[1] & ~fmcn7_sync[0]);
    assign FMCN8Pulse = (fmcn8_sync[1] & ~fmcn8_sync[0]);
    assign FMCN9Pulse = (fmcn9_sync[1] & ~fmcn9_sync[0]);
    assign FMCN19Pulse = (fmcn19_sync[1] & ~fmcn19_sync[0]);
    assign FMCN18Pulse = (fmcn18_sync[1] & ~fmcn18_sync[0]);
    assign FMCN17Pulse = (fmcn17_sync[1] & ~fmcn17_sync[0]);
    assign FMCN16Pulse = (fmcn16_sync[1] & ~fmcn16_sync[0]);
    assign FMCN15Pulse = (fmcn15_sync[1] & ~fmcn15_sync[0]);
    
    // Counters
    reg [31:0] nFMCP0Hits = 0, nFMCP5Hits = 0, nFMCP6Hits = 0, nFMCP7Hits = 0, nFMCP8Hits = 0, nFMCP9Hits = 0;
    reg [31:0] nFMCP19Hits = 0, nFMCP18Hits = 0, nFMCP17Hits = 0, nFMCP16Hits = 0, nFMCP15Hits = 0;
    reg [31:0] nFMCN0Hits = 0, nFMCN5Hits = 0, nFMCN6Hits = 0, nFMCN7Hits = 0, nFMCN8Hits = 0, nFMCN9Hits = 0;
    reg [31:0] nFMCN19Hits = 0, nFMCN18Hits = 0, nFMCN17Hits = 0, nFMCN16Hits = 0, nFMCN15Hits = 0;
    
    // Increment counters on pulse
    always @(posedge Clk100) begin
        if (FMCP0Pulse)  nFMCP0Hits  <= nFMCP0Hits + 1;
        if (FMCP5Pulse)  nFMCP5Hits  <= nFMCP5Hits + 1;
        if (FMCP6Pulse)  nFMCP6Hits  <= nFMCP6Hits + 1;
        if (FMCP7Pulse)  nFMCP7Hits  <= nFMCP7Hits + 1;
        if (FMCP8Pulse)  nFMCP8Hits  <= nFMCP8Hits + 1;
        if (FMCP9Pulse)  nFMCP9Hits  <= nFMCP9Hits + 1;
        if (FMCP19Pulse) nFMCP19Hits <= nFMCP19Hits + 1;
        if (FMCP18Pulse) nFMCP18Hits <= nFMCP18Hits + 1;
        if (FMCP17Pulse) nFMCP17Hits <= nFMCP17Hits + 1;
        if (FMCP16Pulse) nFMCP16Hits <= nFMCP16Hits + 1;
        if (FMCP15Pulse) nFMCP15Hits <= nFMCP15Hits + 1;
        if (FMCN0Pulse)  nFMCN0Hits  <= nFMCN0Hits + 1;
        if (FMCN5Pulse)  nFMCN5Hits  <= nFMCN5Hits + 1;
        if (FMCN6Pulse)  nFMCN6Hits  <= nFMCN6Hits + 1;
        if (FMCN7Pulse)  nFMCN7Hits  <= nFMCN7Hits + 1;
        if (FMCN8Pulse)  nFMCN8Hits  <= nFMCN8Hits + 1;
        if (FMCN9Pulse)  nFMCN9Hits  <= nFMCN9Hits + 1;
        if (FMCN19Pulse) nFMCN19Hits <= nFMCN19Hits + 1;
        if (FMCN18Pulse) nFMCN18Hits <= nFMCN18Hits + 1;
        if (FMCN17Pulse) nFMCN17Hits <= nFMCN17Hits + 1;
        if (FMCN16Pulse) nFMCN16Hits <= nFMCN16Hits + 1;
        if (FMCN15Pulse) nFMCN15Hits <= nFMCN15Hits + 1;
    end
    
    // Output to memory-mapped registers
    assign reg_ro_out[31 + 32*2  : 32*2]  = nFMCP0Hits;   // 0x8002_0108
    assign reg_ro_out[31 + 32*3  : 32*3]  = nFMCN0Hits;   // 0x8002_010C
    assign reg_ro_out[31 + 32*4  : 32*4]  = nFMCP5Hits;   // 0x8002_0110
    assign reg_ro_out[31 + 32*5  : 32*5]  = nFMCN5Hits;   // 0x8002_0114
    assign reg_ro_out[31 + 32*6  : 32*6]  = nFMCP6Hits;   // 0x8002_0118
    assign reg_ro_out[31 + 32*7  : 32*7]  = nFMCN6Hits;   // 0x8002_011C
    assign reg_ro_out[31 + 32*8  : 32*8]  = nFMCP7Hits;   // 0x8002_0120
    assign reg_ro_out[31 + 32*9  : 32*9]  = nFMCN7Hits;   // 0x8002_0124
    assign reg_ro_out[31 + 32*10 : 32*10] = nFMCP8Hits;   // 0x8002_0128
    assign reg_ro_out[31 + 32*11 : 32*11] = nFMCN8Hits;   // 0x8002_012C
    assign reg_ro_out[31 + 32*12 : 32*12] = nFMCP9Hits;   // 0x8002_0130
    assign reg_ro_out[31 + 32*13 : 32*13] = nFMCN9Hits;   // 0x8002_0134
    assign reg_ro_out[31 + 32*14 : 32*14] = nFMCP19Hits;  // 0x8002_0138
    assign reg_ro_out[31 + 32*15 : 32*15] = nFMCN19Hits;  // 0x8002_013C
    assign reg_ro_out[31 + 32*16 : 32*16] = nFMCP18Hits;  // 0x8002_0140
    assign reg_ro_out[31 + 32*17 : 32*17] = nFMCN18Hits;  // 0x8002_0144
    assign reg_ro_out[31 + 32*18 : 32*18] = nFMCP17Hits;  // 0x8002_0148
    assign reg_ro_out[31 + 32*19 : 32*19] = nFMCN17Hits;  // 0x8002_014C
    assign reg_ro_out[31 + 32*20 : 32*20] = nFMCP16Hits;  // 0x8002_0150
    assign reg_ro_out[31 + 32*21 : 32*21] = nFMCN16Hits;  // 0x8002_0154
    assign reg_ro_out[31 + 32*22 : 32*22] = nFMCP15Hits;  // 0x8002_0158
    assign reg_ro_out[31 + 32*23 : 32*23] = nFMCN15Hits;  // 0x8002_015C 
      
   // Testing the input from the PTB into Petalinux
   /*
   reg [31:0] nIOD7=0; //Max is 4.3B
   reg IOD7reg;
   always @(posedge Clk100) begin // Input Trigger from the PTB.
        IOD7reg<=IOD7;
        if(~IOD7reg & IOD7)
            nIOD7<=nIOD7+1;
   end     
   assign reg_ro_out [31+32*2:0+32*2] = nIOD7[31:0];  //this goes to 0x8002_0108 (4Hex=32bit address later)
   */
   
   
   //assign reg_ro_out [ 1 * 32 + 7 : 1 * 32 + 0 ] = IOC[7:0]; //this goes to 0xA0000104
   //assign reg_ro_out [ 1 * 32 + 31 : 1 * 32 + 8 ] = 0;
   // peak 0xA0000104 returns 0x000000aa as expected.
   
   //assign reg_ro_out [ 2 * 32 + 25 : 2 * 32 + 0 ] = IOA;//this goes to 0xA0000108
   //assign reg_ro_out [ 2 * 32 + 31 : 2 * 32 + 26 ] = 0;
   // peeking the address above 0xA0000108 gives 0x03ffffff which is 32'b000000111... 26 1's.
   // So no assignments to IOA makes them all 1's.
   
   //assign reg_ro_out [ 3 * 32 + 25 : 3 * 32 + 0 ] = IOB; //this goes to 0xA000 010C
   //assign reg_ro_out [ 3 * 32 + 31 : 3 * 32 + 26 ] = 0;
   //assign reg_ro_out [ 4 * 32 + 31 : 4 * 32 + 0 ] = FMCN; //this goes to 0xA000 0110
   //assign reg_ro_out [ 5 * 32 + 31 : 5 * 32 + 0 ] = FMCP; //this goes to 0xA000 0114
   
   //assign reg_ro_out [6 * 32] = Clk1; //this goes to 0xA000 0118
   //assign reg_ro_out [6 * 32 + 31: 6 * 32 + 1] = 0; 
   
   //0118, 011C, 0120,0124, 0128, ... every 4 address increase 16's place.
   // 63 should be 256's place increment by 1 (ie from 100 to 200)- 4.
   //assign reg_ro_out [ 63 * 32 +  31 : 63 * 32 +  0] = 32'hdeadbeef;//this goes to 0xA000 01FC
   //assign LEDS[0] = count[31];
   //assign LEDS[1] = count[30];
   //assign LEDS[2] = count[29]; 


endmodule

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
