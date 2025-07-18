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
    inout [3:0] IOE,
    inout [6:0] IOD,
    input IOD7,
    // PS accessible bits 32x64.
    output [2047:0] reg_ro_out,
    output [2047:0] reg_ro_out1
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
    reg [1:0] fmcp14_sync = 2'b11;
    reg [1:0] fmcn14_sync = 2'b11;
    reg [1:0] fmcp13_sync = 2'b11;
    reg [1:0] fmcn13_sync = 2'b11;
    reg [1:0] fmcp12_sync = 2'b11;
    reg [1:0] fmcn12_sync = 2'b11;
    reg [1:0] fmcp11_sync = 2'b11;
    reg [1:0] fmcn11_sync = 2'b11;
    reg [1:0] fmcp10_sync = 2'b11;
    reg [1:0] fmcn10_sync = 2'b11;
    reg [1:0] fmcp20_sync = 2'b11;
    reg [1:0] fmcn20_sync = 2'b11;
    reg [1:0] fmcp21_sync = 2'b11;
    reg [1:0] fmcn21_sync = 2'b11;
    reg [1:0] fmcp22_sync = 2'b11;
    reg [1:0] fmcn22_sync = 2'b11;
    reg [1:0] fmcp23_sync = 2'b11;
    reg [1:0] fmcn23_sync = 2'b11;
    reg [1:0] fmcn27_sync = 2'b11;
    reg [1:0] fmcp27_sync = 2'b11;
    reg [1:0] fmcn26_sync = 2'b11;
    reg [1:0] fmcp26_sync = 2'b11;
    reg [1:0] fmcn25_sync = 2'b11;
    reg [1:0] fmcp25_sync = 2'b11;
    reg [1:0] fmcn24_sync = 2'b11;
    reg [1:0] fmcp24_sync = 2'b11;
    reg [1:0] fmcp28_sync = 2'b11;
    reg [1:0] fmcn28_sync = 2'b11;
    reg [1:0] fmcp29_sync = 2'b11;
    reg [1:0] fmcn29_sync = 2'b11;
    reg [1:0] fmcn31_sync = 2'b11;
    reg [1:0] fmcp31_sync = 2'b11;
    reg [1:0] fmcn30_sync = 2'b11;
    reg [1:0] fmcp30_sync = 2'b11;
    reg [1:0] fmcp32_sync = 2'b11;
    reg [1:0] fmcp33_sync = 2'b11;
    reg [1:0] fmcn33_sync = 2'b11;
    reg [1:0] fmcn32_sync = 2'b11;
    reg [1:0] ioa22_sync = 2'b11;
    reg [1:0] ioa20_sync = 2'b11;
    reg [1:0] ioc0_sync = 2'b11;
    reg [1:0] ioc1_sync = 2'b11;
    reg [1:0] ioc2_sync = 2'b11;
    reg [1:0] ioc3_sync = 2'b11;
    reg [1:0] ioc4_sync = 2'b11;
    reg [1:0] ioc5_sync = 2'b11;
    reg [1:0] ioc6_sync = 2'b11;
    reg [1:0] ioc7_sync = 2'b11;
    reg [1:0] ioe0_sync = 2'b11;
    reg [1:0] ioe1_sync = 2'b11;
    reg [1:0] iob13_sync = 2'b11;
    reg [1:0] iob15_sync = 2'b11;
    reg [1:0] iob17_sync = 2'b11;
    reg [1:0] iob19_sync = 2'b11;
    reg [1:0] iob21_sync = 2'b11;
    reg [1:0] iob23_sync = 2'b11;
    reg [1:0] ioa7_sync = 2'b11;
    reg [1:0] ioa5_sync = 2'b11;
    reg [1:0] ioa3_sync = 2'b11;
    reg [1:0] ioa1_sync = 2'b11;
    reg [1:0] iob6_sync = 2'b11;
    reg [1:0] iob4_sync = 2'b11;
    reg [1:0] iob2_sync = 2'b11;
    reg [1:0] iob0_sync = 2'b11;
    reg [1:0] iob1_sync = 2'b11;
    reg [1:0] iob3_sync = 2'b11;
    reg [1:0] iob5_sync = 2'b11;
    reg [1:0] iob7_sync = 2'b11;
    reg [1:0] iob9_sync = 2'b11;
    reg [1:0] iob11_sync = 2'b11;
    reg [1:0] ioa21_sync = 2'b11;
    reg [1:0] ioa23_sync = 2'b11;
    reg [1:0] iob22_sync = 2'b11;
    reg [1:0] iob20_sync = 2'b11;
    reg [1:0] iob18_sync = 2'b11;
    reg [1:0] iob16_sync = 2'b11;
    reg [1:0] iob14_sync = 2'b11;
    reg [1:0] iob12_sync = 2'b11;
    reg [1:0] iob10_sync = 2'b11;
    reg [1:0] iob8_sync = 2'b11;
    
    
    // Pulse wires
    wire FMCP0Pulse, FMCP5Pulse, FMCP6Pulse, FMCP7Pulse, FMCP8Pulse, FMCP9Pulse, FMCP19Pulse, FMCP18Pulse, FMCP17Pulse, FMCP16Pulse, FMCP15Pulse;
    wire FMCN0Pulse, FMCN5Pulse, FMCN6Pulse, FMCN7Pulse, FMCN8Pulse, FMCN9Pulse, FMCN19Pulse, FMCN18Pulse, FMCN17Pulse, FMCN16Pulse, FMCN15Pulse;
    wire FMCP14Pulse, FMCN14Pulse, FMCP13Pulse, FMCN13Pulse, FMCP12Pulse, FMCN12Pulse, FMCP11Pulse, FMCN11Pulse, FMCP10Pulse, FMCN10Pulse, FMCP20Pulse;
    wire FMCN20Pulse, FMCP21Pulse, FMCN21Pulse, FMCP22Pulse, FMCN22Pulse, FMCP23Pulse, FMCN23Pulse, FMCN27Pulse, FMCP27Pulse, FMCN26Pulse, FMCP26Pulse;
    wire FMCN25Pulse, FMCP25Pulse, FMCN24Pulse, FMCP24Pulse, FMCP28Pulse, FMCN28Pulse, FMCP29Pulse, FMCN29Pulse, FMCN31Pulse, FMCP31Pulse, FMCN30Pulse;
    wire FMCP30Pulse, FMCP32Pulse, FMCP33Pulse, FMCN33Pulse, FMCN32Pulse, IOA22Pulse, IOA20Pulse, IOC0Pulse, IOC1Pulse, IOC2Pulse, IOC3Pulse;
    wire IOC4Pulse, ICO5Pulse, IOC6Pulse, IOC7Pulse,IOE0Pulse, IOE1Pulse, IOB13Pulse, IOB15Pulse, IOB17Pulse, ICB19Pulse, IOB21Pulse, IOB23Pulse;
    wire IOA7Pulse, IOA5Pulse, IOA3Pulse, IOA1Pulse, IOB6Pulse, IOB4Pulse, IOB2Pulse, IOB0Pulse, IOB1Pulse, IOB3Pulse, IOB5Pulse, IOB7Pulse;
    wire IOB9Pulse, IOB11Pulse, IOA21Pulse, IOA23Pulse, IOB22Pulse, IOB20Pulse, IOB18Pulse, IOB16Pulse, IOB14Pulse, IOB12Pulse, IOB10Pulse, IOB8Pulse;
    
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
        fmcp14_sync  <= {fmcp14_sync[0],  FMCP[14]};
        fmcn14_sync  <= {fmcn14_sync[0],  FMCN[14]};
        fmcp13_sync  <= {fmcp13_sync[0],  FMCP[13]};
        fmcn13_sync  <= {fmcn13_sync[0],  FMCN[13]};
        fmcp12_sync  <= {fmcp12_sync[0],  FMCP[12]};
        fmcn12_sync  <= {fmcn12_sync[0],  FMCN[12]};
        fmcp11_sync  <= {fmcp11_sync[0],  FMCP[11]};
        fmcn11_sync  <= {fmcn11_sync[0],  FMCN[11]};
        fmcp10_sync  <= {fmcp10_sync[0],  FMCP[10]};
        fmcn10_sync  <= {fmcn10_sync[0],  FMCN[10]};
        fmcp20_sync  <= {fmcp20_sync[0],  FMCP[20]};
        fmcn20_sync  <= {fmcn20_sync[0],  FMCN[20]};
        fmcp21_sync  <= {fmcp21_sync[0],  FMCP[21]};
        fmcn21_sync  <= {fmcn21_sync[0],  FMCN[21]};
        fmcp22_sync  <= {fmcp22_sync[0],  FMCP[22]};
        fmcn22_sync  <= {fmcn22_sync[0],  FMCN[22]};
        fmcp23_sync  <= {fmcp23_sync[0],  FMCP[23]};
        fmcn23_sync  <= {fmcn23_sync[0],  FMCN[23]};
        fmcp27_sync  <= {fmcp27_sync[0],  FMCP[27]};
        fmcn27_sync  <= {fmcn27_sync[0],  FMCN[27]};
        fmcp26_sync  <= {fmcp26_sync[0],  FMCP[26]};
        fmcn26_sync  <= {fmcn26_sync[0],  FMCN[26]};
        fmcp25_sync  <= {fmcp25_sync[0],  FMCP[25]};
        fmcn25_sync  <= {fmcn25_sync[0],  FMCN[25]};
        fmcp24_sync  <= {fmcp24_sync[0],  FMCP[24]};
        fmcn24_sync  <= {fmcn24_sync[0],  FMCN[24]};
        fmcp28_sync  <= {fmcp28_sync[0],  FMCP[28]};
        fmcn28_sync  <= {fmcn28_sync[0],  FMCN[28]};
        fmcp29_sync  <= {fmcp29_sync[0],  FMCP[29]};
        fmcn29_sync  <= {fmcn29_sync[0],  FMCN[29]};
        fmcp31_sync  <= {fmcp31_sync[0],  FMCP[31]};
        fmcn31_sync  <= {fmcn31_sync[0],  FMCN[31]};
        fmcp30_sync  <= {fmcp30_sync[0],  FMCP[30]};
        fmcn30_sync  <= {fmcn30_sync[0],  FMCN[30]};
        fmcp32_sync  <= {fmcp32_sync[0],  FMCP[32]};
        fmcn32_sync  <= {fmcn32_sync[0],  FMCN[32]};
        fmcp33_sync  <= {fmcp33_sync[0],  FMCP[33]};
        fmcn33_sync  <= {fmcn33_sync[0],  FMCN[33]};
        ioa22_sync  <= {ioa22_sync[0],  IOA[22]};
        ioa20_sync  <= {ioa20_sync[0],  IOA[20]};
        ioc0_sync  <= {ioc0_sync[0],  IOC[0]};
        ioc1_sync  <= {ioc1_sync[0],  IOC[1]};
        ioc2_sync  <= {ioc2_sync[0],  IOC[2]};
        ioc3_sync  <= {ioc3_sync[0],  IOC[3]};
        ioc4_sync  <= {ioc4_sync[0],  IOC[4]};
        ioc5_sync  <= {ioc5_sync[0],  IOC[5]};
        ioc6_sync  <= {ioc6_sync[0],  IOC[6]};
        ioc7_sync  <= {ioc7_sync[0],  IOC[7]};
        ioe0_sync  <= {ioe0_sync[0],  IOE[0]};
        ioe1_sync  <= {ioe1_sync[0],  IOE[1]};
        iob13_sync  <= {iob13_sync[0],  IOB[13]};
        iob15_sync  <= {iob15_sync[0],  IOB[15]};
        iob17_sync  <= {iob17_sync[0],  IOB[17]};
        iob19_sync  <= {iob19_sync[0],  IOB[19]};
        iob21_sync  <= {iob21_sync[0],  IOB[21]};
        iob23_sync  <= {iob23_sync[0],  IOB[23]};
        ioa7_sync  <= {ioa7_sync[0],  IOA[7]};
        ioa5_sync  <= {ioa5_sync[0],  IOA[5]};
        ioa3_sync  <= {ioa3_sync[0],  IOA[3]};
        ioa1_sync  <= {ioa1_sync[0],  IOA[1]};
        iob6_sync  <= {iob6_sync[0],  IOB[6]};
        iob4_sync  <= {iob4_sync[0],  IOB[4]};
        iob2_sync  <= {iob2_sync[0],  IOB[2]};
        iob0_sync  <= {iob0_sync[0],  IOB[0]};
        iob1_sync  <= {iob1_sync[0],  IOB[1]};
        iob3_sync  <= {iob3_sync[0],  IOB[3]};
        iob5_sync  <= {iob5_sync[0],  IOB[5]};
        iob7_sync  <= {iob7_sync[0],  IOB[7]};
        iob9_sync  <= {iob9_sync[0],  IOB[9]};
        iob11_sync  <= {iob11_sync[0],  IOB[11]};
        ioa21_sync  <= {ioa21_sync[0],  IOA[21]};
        ioa23_sync  <= {ioa23_sync[0],  IOA[23]};
        iob22_sync  <= {iob22_sync[0],  IOB[22]};
        iob20_sync  <= {iob20_sync[0],  IOB[20]};
        iob18_sync  <= {iob18_sync[0],  IOB[18]};
        iob16_sync  <= {iob16_sync[0],  IOB[16]};
        iob14_sync  <= {iob14_sync[0],  IOB[14]};
        iob12_sync  <= {iob12_sync[0],  IOB[12]};
        iob10_sync  <= {iob10_sync[0],  IOB[10]};
        iob8_sync  <= {iob8_sync[0],  IOB[8]};
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
   
    assign FMCP14Pulse  = (fmcp14_sync[1]  & ~fmcp14_sync[0]);
    assign FMCN14Pulse  = (fmcn14_sync[1]  & ~fmcn14_sync[0]);
    assign FMCP13Pulse  = (fmcp13_sync[1]  & ~fmcp13_sync[0]);
    assign FMCN13Pulse  = (fmcn13_sync[1]  & ~fmcn13_sync[0]);
    assign FMCP12Pulse  = (fmcp12_sync[1]  & ~fmcp12_sync[0]);
    assign FMCN12Pulse  = (fmcn12_sync[1]  & ~fmcn12_sync[0]);
    assign FMCP11Pulse  = (fmcp11_sync[1]  & ~fmcp11_sync[0]);
    assign FMCN11Pulse  = (fmcn11_sync[1]  & ~fmcn11_sync[0]);
    assign FMCP10Pulse  = (fmcp10_sync[1]  & ~fmcp10_sync[0]);
    assign FMCN10Pulse  = (fmcn10_sync[1]  & ~fmcn10_sync[0]);
    
    assign FMCP20Pulse  = (fmcp20_sync[1]  & ~fmcp20_sync[0]);
    assign FMCN20Pulse  = (fmcn20_sync[1]  & ~fmcn20_sync[0]);
    assign FMCP21Pulse  = (fmcp21_sync[1]  & ~fmcp21_sync[0]);
    assign FMCN21Pulse  = (fmcn21_sync[1]  & ~fmcn21_sync[0]);
    assign FMCP22Pulse  = (fmcp22_sync[1]  & ~fmcp22_sync[0]);
    assign FMCN22Pulse  = (fmcn22_sync[1]  & ~fmcn22_sync[0]);
    assign FMCP23Pulse  = (fmcp23_sync[1]  & ~fmcp23_sync[0]);
    assign FMCN23Pulse  = (fmcn23_sync[1]  & ~fmcn23_sync[0]);
    
    assign FMCP27Pulse  = (fmcp27_sync[1]  & ~fmcp27_sync[0]);
    assign FMCN27Pulse  = (fmcn27_sync[1]  & ~fmcn27_sync[0]);
    assign FMCP26Pulse  = (fmcp26_sync[1]  & ~fmcp26_sync[0]);
    assign FMCN26Pulse  = (fmcn26_sync[1]  & ~fmcn26_sync[0]);
    assign FMCP25Pulse  = (fmcp25_sync[1]  & ~fmcp25_sync[0]);
    assign FMCN25Pulse  = (fmcn25_sync[1]  & ~fmcn25_sync[0]);
    assign FMCP24Pulse  = (fmcp24_sync[1]  & ~fmcp24_sync[0]);
    assign FMCN24Pulse  = (fmcn24_sync[1]  & ~fmcn24_sync[0]);
    
    assign FMCP28Pulse  = (fmcp28_sync[1]  & ~fmcp28_sync[0]);
    assign FMCN28Pulse  = (fmcn28_sync[1]  & ~fmcn28_sync[0]);
    assign FMCP29Pulse  = (fmcp29_sync[1]  & ~fmcp29_sync[0]);
    assign FMCN29Pulse  = (fmcn29_sync[1]  & ~fmcn29_sync[0]);
    
    assign FMCP31Pulse  = (fmcp31_sync[1]  & ~fmcp31_sync[0]);
    assign FMCN31Pulse  = (fmcn31_sync[1]  & ~fmcn31_sync[0]);
    assign FMCP30Pulse  = (fmcp30_sync[1]  & ~fmcp30_sync[0]);
    assign FMCN30Pulse  = (fmcn30_sync[1]  & ~fmcn30_sync[0]);
    
    assign FMCP32Pulse  = (fmcp32_sync[1]  & ~fmcp32_sync[0]);
    assign FMCN32Pulse  = (fmcn32_sync[1]  & ~fmcn32_sync[0]);
    assign FMCP33Pulse  = (fmcp33_sync[1]  & ~fmcp33_sync[0]);
    assign FMCN33Pulse  = (fmcn33_sync[1]  & ~fmcn33_sync[0]);
    
    assign IOA22Pulse  = (ioa22_sync[1]  & ~ioa22_sync[0]);
    assign IOA20Pulse  = (ioa20_sync[1]  & ~ioa20_sync[0]);
    
    assign IOC0Pulse  = (ioc0_sync[1]  & ~ioc0_sync[0]);
    assign IOC1Pulse  = (ioc1_sync[1]  & ~ioc1_sync[0]);
    assign IOC2Pulse  = (ioc2_sync[1]  & ~ioc2_sync[0]);
    assign IOC3Pulse  = (ioc3_sync[1]  & ~ioc3_sync[0]);
    assign IOC4Pulse  = (ioc4_sync[1]  & ~ioc4_sync[0]);
    assign IOC5Pulse  = (ioc5_sync[1]  & ~ioc5_sync[0]);
    assign IOC6Pulse  = (ioc6_sync[1]  & ~ioc6_sync[0]);
    assign IOC7Pulse  = (ioc7_sync[1]  & ~ioc7_sync[0]);
    
    assign IOE0Pulse  = (ioe0_sync[1]  & ~ioe0_sync[0]);
    assign IOE1Pulse  = (ioe1_sync[1]  & ~ioe1_sync[0]);
    
    assign IOB13Pulse  = (iob13_sync[1]  & ~iob13_sync[0]);
    assign IOB15Pulse  = (iob15_sync[1]  & ~iob15_sync[0]);
    assign IOB17Pulse  = (iob17_sync[1]  & ~iob17_sync[0]);
    assign IOB19Pulse  = (iob19_sync[1]  & ~iob19_sync[0]);
    assign IOB21Pulse  = (iob21_sync[1]  & ~iob23_sync[0]);
    assign IOB23Pulse  = (iob23_sync[1]  & ~iob23_sync[0]);
    
    assign IOA7Pulse  = (ioa7_sync[1]  & ~ioa7_sync[0]);
    assign IOA5Pulse  = (ioa5_sync[1]  & ~ioa5_sync[0]);
    assign IOA3Pulse  = (ioa3_sync[1]  & ~ioa3_sync[0]);
    assign IOA1Pulse  = (ioa1_sync[1]  & ~ioa1_sync[0]);

    assign IOB6Pulse  = (iob6_sync[1]  & ~iob6_sync[0]);
    assign IOB4Pulse  = (iob4_sync[1]  & ~iob4_sync[0]);
    assign IOB2Pulse  = (iob2_sync[1]  & ~iob2_sync[0]);
    assign IOB0Pulse  = (iob0_sync[1]  & ~iob0_sync[0]);
    assign IOB1Pulse  = (iob1_sync[1]  & ~iob1_sync[0]);
    assign IOB3Pulse  = (iob3_sync[1]  & ~iob3_sync[0]);
    assign IOB5Pulse  = (iob5_sync[1]  & ~iob5_sync[0]);
    assign IOB7Pulse  = (iob7_sync[1]  & ~iob7_sync[0]);
    assign IOB9Pulse  = (iob9_sync[1]  & ~iob9_sync[0]);
    assign IOB11Pulse  = (iob11_sync[1]  & ~iob11_sync[0]);
    
    assign IOA21Pulse  = (ioa21_sync[1]  & ~ioa21_sync[0]);
    assign IOA23Pulse  = (ioa23_sync[1]  & ~ioa23_sync[0]);

    
    assign IOB22Pulse  = (iob22_sync[1]  & ~iob22_sync[0]);
    assign IOB20Pulse  = (iob20_sync[1]  & ~iob20_sync[0]);
    assign IOB18Pulse  = (iob18_sync[1]  & ~iob18_sync[0]);
    assign IOB16Pulse  = (iob16_sync[1]  & ~iob16_sync[0]);
    assign IOB14Pulse  = (iob14_sync[1]  & ~iob14_sync[0]);
    assign IOB12Pulse  = (iob12_sync[1]  & ~iob12_sync[0]);
    assign IOB10Pulse  = (iob10_sync[1]  & ~iob10_sync[0]);
    assign IOB8Pulse  = (iob8_sync[1]  & ~iob8_sync[0]);
    
    // Counters
    reg [31:0] nFMCP0Hits = 0,  nFMCP5Hits = 0,  nFMCP6Hits = 0,  nFMCP7Hits = 0,  nFMCP8Hits = 0,  nFMCP9Hits = 0;
    reg [31:0] nFMCP19Hits = 0, nFMCP18Hits = 0, nFMCP17Hits = 0, nFMCP16Hits = 0, nFMCP15Hits = 0, nFMCP14Hits = 0;
    reg [31:0] nFMCP13Hits = 0, nFMCP12Hits = 0, nFMCP11Hits = 0, nFMCP10Hits = 0, nFMCP20Hits = 0, nFMCP21Hits = 0;
    reg [31:0] nFMCP22Hits = 0, nFMCP23Hits = 0, nFMCP27Hits = 0, nFMCP26Hits = 0, nFMCP25Hits = 0, nFMCP24Hits = 0;
    reg [31:0] nFMCP28Hits = 0, nFMCP29Hits = 0, nFMCP31Hits = 0, nFMCP30Hits = 0, nFMCP32Hits = 0, nFMCP33Hits = 0;
    
    reg [31:0] nFMCN0Hits = 0,  nFMCN5Hits = 0,  nFMCN6Hits = 0,  nFMCN7Hits = 0,  nFMCN8Hits = 0,  nFMCN9Hits = 0;
    reg [31:0] nFMCN19Hits = 0, nFMCN18Hits = 0, nFMCN17Hits = 0, nFMCN16Hits = 0, nFMCN15Hits = 0, nFMCN14Hits = 0;
    reg [31:0] nFMCN13Hits = 0, nFMCN12Hits = 0, nFMCN11Hits = 0, nFMCN10Hits = 0, nFMCN20Hits = 0, nFMCN21Hits = 0;
    reg [31:0] nFMCN22Hits = 0, nFMCN23Hits = 0, nFMCN27Hits = 0, nFMCN26Hits = 0, nFMCN25Hits = 0, nFMCN24Hits = 0;
    reg [31:0] nFMCN28Hits = 0, nFMCN29Hits = 0, nFMCN31Hits = 0, nFMCN30Hits = 0, nFMCN32Hits = 0, nFMCN33Hits = 0;
    
    reg [31:0] nIOA22Hits = 0, nIOA20Hits = 0, nIOC0Hits = 0, nIOC1Hits = 0, nIOC2Hits = 0, nIOC3Hits = 0, nIOC4Hits = 0, nIOC5Hits = 0, nIOC6Hits = 0;
    reg [31:0] nIOC7Hits = 0, nIOE0Hits = 0, nIOE1Hits = 0, nIOB13Hits = 0, nIOB15Hits = 0, nIOB17Hits = 0, nIOB19Hits = 0, nIOB21Hits = 0;
    reg [31:0] nIOB23Hits = 0, nIOA7Hits = 0, nIOA5Hits = 0, nIOA3Hits = 0, nIOA1Hits = 0, nIOB6Hits = 0, nIOB4Hits = 0, nIOB2Hits = 0;
    reg [31:0] nIOB0Hits = 0, nIOB1Hits = 0, nIOB3Hits = 0, nIOB5Hits = 0, nIOB7Hits = 0, nIOB9Hits = 0, nIOB11Hits = 0, nIOA21Hits = 0;
    reg [31:0] nIOA23Hits = 0, nIOB22Hits = 0, nIOB20Hits = 0, nIOB18Hits = 0, nIOB16Hits = 0, nIOB14Hits = 0, nIOB12Hits = 0;
    reg [31:0] nIOB10Hits = 0, nIOB8Hits = 0;

    
     // Increment counters on pulse
    always @(posedge Clk100) begin
        if (FMCP0Pulse)   nFMCP0Hits   <= nFMCP0Hits + 1;
        if (FMCP5Pulse)   nFMCP5Hits   <= nFMCP5Hits + 1;
        if (FMCP6Pulse)   nFMCP6Hits   <= nFMCP6Hits + 1;
        if (FMCP7Pulse)   nFMCP7Hits   <= nFMCP7Hits + 1;
        if (FMCP8Pulse)   nFMCP8Hits   <= nFMCP8Hits + 1;
        if (FMCP9Pulse)   nFMCP9Hits   <= nFMCP9Hits + 1;
        if (FMCP19Pulse)  nFMCP19Hits  <= nFMCP19Hits + 1;
        if (FMCP18Pulse)  nFMCP18Hits  <= nFMCP18Hits + 1;
        if (FMCP17Pulse)  nFMCP17Hits  <= nFMCP17Hits + 1;
        if (FMCP16Pulse)  nFMCP16Hits  <= nFMCP16Hits + 1;
        if (FMCP15Pulse)  nFMCP15Hits  <= nFMCP15Hits + 1;
        if (FMCP14Pulse)  nFMCP14Hits  <= nFMCP14Hits + 1;
        if (FMCP13Pulse)  nFMCP13Hits  <= nFMCP13Hits + 1;
        if (FMCP12Pulse)  nFMCP12Hits  <= nFMCP12Hits + 1;
        if (FMCP11Pulse)  nFMCP11Hits  <= nFMCP11Hits + 1;
        if (FMCP10Pulse)  nFMCP10Hits  <= nFMCP10Hits + 1;
        if (FMCP20Pulse)  nFMCP20Hits  <= nFMCP20Hits + 1;
        if (FMCP21Pulse)  nFMCP21Hits  <= nFMCP21Hits + 1;
        if (FMCP22Pulse)  nFMCP22Hits  <= nFMCP22Hits + 1;
        if (FMCP23Pulse)  nFMCP23Hits  <= nFMCP23Hits + 1;
        if (FMCP27Pulse)  nFMCP27Hits  <= nFMCP27Hits + 1;
        if (FMCP26Pulse)  nFMCP26Hits  <= nFMCP26Hits + 1;
        if (FMCP25Pulse)  nFMCP25Hits  <= nFMCP25Hits + 1;
        if (FMCP24Pulse)  nFMCP24Hits  <= nFMCP24Hits + 1;
        if (FMCP28Pulse)  nFMCP28Hits  <= nFMCP28Hits + 1;
        if (FMCP29Pulse)  nFMCP29Hits  <= nFMCP29Hits + 1;
        if (FMCP31Pulse)  nFMCP31Hits  <= nFMCP31Hits + 1;
        if (FMCP30Pulse)  nFMCP30Hits  <= nFMCP30Hits + 1;
        if (FMCP32Pulse)  nFMCP32Hits  <= nFMCP32Hits + 1;
        if (FMCP33Pulse)  nFMCP33Hits  <= nFMCP33Hits + 1;
    
        if (FMCN0Pulse)   nFMCN0Hits   <= nFMCN0Hits + 1;
        if (FMCN5Pulse)   nFMCN5Hits   <= nFMCN5Hits + 1;
        if (FMCN6Pulse)   nFMCN6Hits   <= nFMCN6Hits + 1;
        if (FMCN7Pulse)   nFMCN7Hits   <= nFMCN7Hits + 1;
        if (FMCN8Pulse)   nFMCN8Hits   <= nFMCN8Hits + 1;
        if (FMCN9Pulse)   nFMCN9Hits   <= nFMCN9Hits + 1;
        if (FMCN19Pulse)  nFMCN19Hits  <= nFMCN19Hits + 1;
        if (FMCN18Pulse)  nFMCN18Hits  <= nFMCN18Hits + 1;
        if (FMCN17Pulse)  nFMCN17Hits  <= nFMCN17Hits + 1;
        if (FMCN16Pulse)  nFMCN16Hits  <= nFMCN16Hits + 1;
        if (FMCN15Pulse)  nFMCN15Hits  <= nFMCN15Hits + 1;
        if (FMCN14Pulse)  nFMCN14Hits  <= nFMCN14Hits + 1;
        if (FMCN13Pulse)  nFMCN13Hits  <= nFMCN13Hits + 1;
        if (FMCN12Pulse)  nFMCN12Hits  <= nFMCN12Hits + 1;
        if (FMCN11Pulse)  nFMCN11Hits  <= nFMCN11Hits + 1;
        if (FMCN10Pulse)  nFMCN10Hits  <= nFMCN10Hits + 1;
        if (FMCN20Pulse)  nFMCN20Hits  <= nFMCN20Hits + 1;
        if (FMCN21Pulse)  nFMCN21Hits  <= nFMCN21Hits + 1;
        if (FMCN22Pulse)  nFMCN22Hits  <= nFMCN22Hits + 1;
        if (FMCN23Pulse)  nFMCN23Hits  <= nFMCN23Hits + 1;
        if (FMCN27Pulse)  nFMCN27Hits  <= nFMCN27Hits + 1;
        if (FMCN26Pulse)  nFMCN26Hits  <= nFMCN26Hits + 1;
        if (FMCN25Pulse)  nFMCN25Hits  <= nFMCN25Hits + 1;
        if (FMCN24Pulse)  nFMCN24Hits  <= nFMCN24Hits + 1;
        if (FMCN28Pulse)  nFMCN28Hits  <= nFMCN28Hits + 1;
        if (FMCN29Pulse)  nFMCN29Hits  <= nFMCN29Hits + 1;
        if (FMCN31Pulse)  nFMCN31Hits  <= nFMCN31Hits + 1;
        if (FMCN30Pulse)  nFMCN30Hits  <= nFMCN30Hits + 1;
        if (FMCN32Pulse)  nFMCN32Hits  <= nFMCN32Hits + 1;
        if (FMCN33Pulse)  nFMCN33Hits  <= nFMCN33Hits + 1;
    
        if (IOA22Pulse)  nIOA22Hits  <= nIOA22Hits + 1;
        if (IOA20Pulse)  nIOA20Hits  <= nIOA20Hits + 1;
        
        if (IOC0Pulse)  nIOC0Hits  <= nIOC0Hits + 1;
        if (IOC1Pulse)  nIOC1Hits  <= nIOC1Hits + 1;
        if (IOC2Pulse)  nIOC2Hits  <= nIOC2Hits + 1;
        if (IOC3Pulse)  nIOC3Hits  <= nIOC3Hits + 1;
        if (IOC4Pulse)  nIOC4Hits  <= nIOC4Hits + 1;
        if (IOC5Pulse)  nIOC5Hits  <= nIOC5Hits + 1;
        if (IOC6Pulse)  nIOC6Hits  <= nIOC6Hits + 1;
        if (IOC7Pulse)  nIOC7Hits  <= nIOC7Hits + 1;
        
        if (IOE0Pulse)  nIOE0Hits  <= nIOE0Hits + 1;
        if (IOE1Pulse)  nIOE1Hits  <= nIOE1Hits + 1;
        
        
        if (IOB13Pulse)  nIOB13Hits  <= nIOB13Hits + 1;
        if (IOB15Pulse)  nIOB15Hits  <= nIOB15Hits + 1;
        if (IOB17Pulse)  nIOB17Hits  <= nIOB17Hits + 1;
        if (IOB19Pulse)  nIOB19Hits  <= nIOB19Hits + 1;
        if (IOB21Pulse)  nIOB21Hits  <= nIOB21Hits + 1;
        if (IOB23Pulse)  nIOB23Hits  <= nIOB23Hits + 1;
        
        if (IOA7Pulse)  nIOA7Hits  <= nIOA7Hits + 1;
        if (IOA5Pulse)  nIOA5Hits  <= nIOA5Hits + 1;
        if (IOA3Pulse)  nIOA3Hits  <= nIOA3Hits + 1;
        if (IOA1Pulse)  nIOA1Hits  <= nIOA1Hits + 1;
        
        
        if (IOB6Pulse)  nIOB6Hits  <= nIOB6Hits + 1;
        if (IOB4Pulse)  nIOB4Hits  <= nIOB4Hits + 1;
        if (IOB2Pulse)  nIOB2Hits  <= nIOB2Hits + 1;
        if (IOB0Pulse)  nIOB0Hits  <= nIOB0Hits + 1;
        if (IOB1Pulse)  nIOB1Hits  <= nIOB1Hits + 1;
        if (IOB3Pulse)  nIOB3Hits  <= nIOB3Hits + 1;
        if (IOB5Pulse)  nIOB5Hits  <= nIOB5Hits + 1;
        if (IOB7Pulse)  nIOB7Hits  <= nIOB7Hits + 1;
        if (IOB9Pulse)  nIOB9Hits  <= nIOB9Hits + 1;
        if (IOB11Pulse)  nIOB11Hits  <= nIOB11Hits + 1;
        
        
        if (IOA21Pulse)  nIOA21Hits  <= nIOA21Hits + 1;
        if (IOA23Pulse)  nIOA23Hits  <= nIOA23Hits + 1;
           
        if (IOB22Pulse)  nIOB22Hits  <= nIOB22Hits + 1;
        if (IOB20Pulse)  nIOB20Hits  <= nIOB20Hits + 1;
        if (IOB18Pulse)  nIOB18Hits  <= nIOB18Hits + 1;
        if (IOB16Pulse)  nIOB16Hits  <= nIOB16Hits + 1;
        if (IOB14Pulse)  nIOB14Hits  <= nIOB14Hits + 1;
        if (IOB12Pulse)  nIOB12Hits  <= nIOB12Hits + 1;
        if (IOB10Pulse)  nIOB10Hits  <= nIOB10Hits + 1;
        if (IOB8Pulse)  nIOB8Hits  <= nIOB8Hits + 1;
        
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
    assign reg_ro_out[31 + 32*24 : 32*24] = nFMCN14Hits;  // 0x8002_0160
    assign reg_ro_out[31 + 32*25 : 32*25] = nFMCP14Hits;  // 0x8002_0164
    assign reg_ro_out[31 + 32*26 : 32*26] = nFMCN13Hits;  // 0x8002_0168
    assign reg_ro_out[31 + 32*27 : 32*27] = nFMCP13Hits;  // 0x8002_016C
    assign reg_ro_out[31 + 32*28 : 32*28] = nFMCN12Hits;  // 0x8002_0170
    assign reg_ro_out[31 + 32*29 : 32*29] = nFMCP12Hits;  // 0x8002_0174
    assign reg_ro_out[31 + 32*30 : 32*30] = nFMCN11Hits;  // 0x8002_0178
    assign reg_ro_out[31 + 32*31 : 32*31] = nFMCP11Hits;  // 0x8002_017C
    assign reg_ro_out[31 + 32*32 : 32*32] = nFMCN10Hits;  // 0x8002_0180
    assign reg_ro_out[31 + 32*33 : 32*33] = nFMCP10Hits;  // 0x8002_0184
    assign reg_ro_out[31 + 32*34 : 32*34] = nFMCP20Hits;  // 0x8002_0188
    assign reg_ro_out[31 + 32*35 : 32*35] = nFMCN20Hits;  // 0x8002_018C
    assign reg_ro_out[31 + 32*36 : 32*36] = nFMCP21Hits;  // 0x8002_0190
    assign reg_ro_out[31 + 32*37 : 32*37] = nFMCN21Hits;  // 0x8002_0194
    assign reg_ro_out[31 + 32*38 : 32*38] = nFMCP22Hits;  // 0x8002_0198
    assign reg_ro_out[31 + 32*39 : 32*39] = nFMCN22Hits;  // 0x8002_019C
    assign reg_ro_out[31 + 32*40 : 32*40] = nFMCP23Hits;  // 0x8002_01A0
    assign reg_ro_out[31 + 32*41 : 32*41] = nFMCN23Hits;  // 0x8002_01A4
    assign reg_ro_out[31 + 32*42 : 32*42] = nFMCN27Hits;  // 0x8002_01A8
    assign reg_ro_out[31 + 32*43 : 32*43] = nFMCP27Hits;  // 0x8002_01AC
    assign reg_ro_out[31 + 32*44 : 32*44] = nFMCN26Hits;  // 0x8002_01B0
    assign reg_ro_out[31 + 32*45 : 32*45] = nFMCP26Hits;  // 0x8002_01B4
    assign reg_ro_out[31 + 32*46 : 32*46] = nFMCN25Hits;  // 0x8002_01B8
    assign reg_ro_out[31 + 32*47 : 32*47] = nFMCP25Hits;  // 0x8002_01BC
    assign reg_ro_out[31 + 32*48 : 32*48] = nFMCN24Hits;  // 0x8002_01C0
    assign reg_ro_out[31 + 32*49 : 32*49] = nFMCP24Hits;  // 0x8002_01C4
    assign reg_ro_out[31 + 32*50 : 32*50] = nFMCP28Hits;  // 0x8002_01C8
    assign reg_ro_out[31 + 32*51 : 32*51] = nFMCN28Hits;  // 0x8002_01CC
    assign reg_ro_out[31 + 32*52 : 32*52] = nFMCP29Hits;  // 0x8002_01D0
    assign reg_ro_out[31 + 32*53 : 32*53] = nFMCN29Hits;  // 0x8002_01D4
    assign reg_ro_out[31 + 32*54 : 32*54] = nFMCN31Hits;  // 0x8002_01D8
    assign reg_ro_out[31 + 32*55 : 32*55] = nFMCP31Hits;  // 0x8002_01DC
    assign reg_ro_out[31 + 32*56 : 32*56] = nFMCN30Hits;  // 0x8002_01E0
    assign reg_ro_out[31 + 32*57 : 32*57] = nFMCP30Hits;  // 0x8002_01E4
    assign reg_ro_out[31 + 32*58 : 32*58] = nFMCP32Hits;  // 0x8002_01E8
    assign reg_ro_out[31 + 32*59 : 32*59] = nFMCP33Hits;  // 0x8002_01EC
    assign reg_ro_out[31 + 32*60 : 32*60] = nFMCN33Hits;  // 0x8002_01F0
    assign reg_ro_out[31 + 32*61 : 32*61] = nFMCN32Hits;  // 0x8002_01F4
    assign reg_ro_out[31 + 32*62 : 32*62] = nIOA22Hits;  // 0x8002_01F8
    assign reg_ro_out[31 + 32*63 : 32*63] = nIOA20Hits;  // 0x8002_01FC
    
    assign reg_ro_out1[31 + 32*0  : 32*0 ] = nIOC0Hits;   // 0x8003_0100
    assign reg_ro_out1[31 + 32*1  : 32*1 ] = nIOC1Hits;   // 0x8003_0104
    assign reg_ro_out1[31 + 32*2  : 32*2 ] = nIOC2Hits;   // 0x8003_0108
    assign reg_ro_out1[31 + 32*3  : 32*3 ] = nIOC3Hits;   // 0x8003_010C
    assign reg_ro_out1[31 + 32*4  : 32*4 ] = nIOC4Hits;   // 0x8003_0110
    assign reg_ro_out1[31 + 32*5  : 32*5 ] = nIOC5Hits;   // 0x8003_0114
    assign reg_ro_out1[31 + 32*6  : 32*6 ] = nIOC6Hits;   // 0x8003_0118
    assign reg_ro_out1[31 + 32*7  : 32*7 ] = nIOC7Hits;   // 0x8003_011C
    assign reg_ro_out1[31 + 32*8  : 32*8 ] = nIOE0Hits;   // 0x8003_0120
    assign reg_ro_out1[31 + 32*9  : 32*9 ] = nIOE1Hits;   // 0x8003_0124
    assign reg_ro_out1[31 + 32*10 : 32*10] = nIOB13Hits;  // 0x8003_0128
    assign reg_ro_out1[31 + 32*11 : 32*11] = nIOB15Hits;  // 0x8003_012C
    assign reg_ro_out1[31 + 32*12 : 32*12] = nIOB17Hits;  // 0x8003_0130
    assign reg_ro_out1[31 + 32*13 : 32*13] = nIOB19Hits;  // 0x8003_0134
    assign reg_ro_out1[31 + 32*14 : 32*14] = nIOB21Hits;  // 0x8003_0138
    assign reg_ro_out1[31 + 32*15 : 32*15] = nIOB23Hits;  // 0x8003_013C
    assign reg_ro_out1[31 + 32*16 : 32*16] = nIOA7Hits;   // 0x8003_0140
    assign reg_ro_out1[31 + 32*17 : 32*17] = nIOA5Hits;   // 0x8003_0144
    assign reg_ro_out1[31 + 32*18 : 32*18] = nIOA3Hits;   // 0x8003_0148
    assign reg_ro_out1[31 + 32*19 : 32*19] = nIOA1Hits;   // 0x8003_014C
    assign reg_ro_out1[31 + 32*20 : 32*20] = nIOB6Hits;   // 0x8003_0150
    assign reg_ro_out1[31 + 32*21 : 32*21] = nIOB4Hits;   // 0x8003_0154
    assign reg_ro_out1[31 + 32*22 : 32*22] = nIOB2Hits;   // 0x8003_0158
    assign reg_ro_out1[31 + 32*23 : 32*23] = nIOB0Hits;   // 0x8003_015C
    assign reg_ro_out1[31 + 32*24 : 32*24] = nIOB1Hits;   // 0x8003_0160
    assign reg_ro_out1[31 + 32*25 : 32*25] = nIOB3Hits;   // 0x8003_0164
    assign reg_ro_out1[31 + 32*26 : 32*26] = nIOB5Hits;   // 0x8003_0168
    assign reg_ro_out1[31 + 32*27 : 32*27] = nIOB7Hits;   // 0x8003_016C
    assign reg_ro_out1[31 + 32*28 : 32*28] = nIOB9Hits;   // 0x8003_0170
    assign reg_ro_out1[31 + 32*29 : 32*29] = nIOB11Hits;  // 0x8003_0174
    assign reg_ro_out1[31 + 32*30 : 32*30] = nIOA21Hits;  // 0x8003_0178
    assign reg_ro_out1[31 + 32*31 : 32*31] = nIOA23Hits;  // 0x8003_017C
    assign reg_ro_out1[31 + 32*32 : 32*32] = nIOB22Hits;  // 0x8003_0180
    assign reg_ro_out1[31 + 32*33 : 32*33] = nIOB20Hits;  // 0x8003_0184
    assign reg_ro_out1[31 + 32*34 : 32*34] = nIOB18Hits;  // 0x8003_0188
    assign reg_ro_out1[31 + 32*35 : 32*35] = nIOB16Hits;  // 0x8003_018C
    assign reg_ro_out1[31 + 32*36 : 32*36] = nIOB14Hits;  // 0x8003_0190
    assign reg_ro_out1[31 + 32*37 : 32*37] = nIOB12Hits;  // 0x8003_0194
    assign reg_ro_out1[31 + 32*38 : 32*38] = nIOB10Hits;  // 0x8003_0198
    assign reg_ro_out1[31 + 32*39 : 32*39] = nIOB8Hits;   // 0x8003_019C
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
