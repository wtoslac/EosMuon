`timescale 1ns / 1ps

module EosMuon(
    input Clk50,
    output LED1,
    output LED2,
    output LED3,
    // Input Channels on PIN-IO A
    input A23,
    input A22,
    input A21,
    input A20,
    input A19,
    input A18,
    input A17,
    input A16,
    input A15,
    input A14,
    input A13,
    input A12,
    input A11,
    input A10,
    input A9,
    input A8,
    input A7,
    input A6,
    input A5,
    input A4,
    input A3,
    input A2,
    input A1,
    input A0,
    input ACLK1,
    input ACLK0,
    // Input ChBnnels on PIN-IO B
    input B23,
    input B22,
    input B21,
    input B20,
    input B19,
    input B18,
    input B17,
    input B16,
    input B15,
    input B14,
    input B13,
    input B12,
    input B11,
    input B10,
    input B9,
    input B8,
    input B7,
    input B6,
    input B5,
    input B4,
    input B3,
    input B2,
    input B1,
    input B0,
    input BCLK1,
    input BCLK0,
    // Input from FMC.
    input FMC02N,
    input FMC02P,
    input FMC03N,
    input FMC03P,
    input FMC04N,
    input FMC04P,
    input FMC05N,
    input FMC05P,
    input FMC06N,
    input FMC06P,
    input FMC07N,
    input FMC07P,
    input FMC08N,
    input FMC08P,
    input FMC09N,
    input FMC09P,
    input FMC10N,
    input FMC10P,
    input FMC11N,
    input FMC11P,
    input FMC12N,
    input FMC12P,
    input FMC13N,
    input FMC13P,
    input FMC14N,
    input FMC14P,
    input FMC15N,
    input FMC15P,
    input FMC16N,
    input FMC16P,
    input FMC19N,
    input FMC19P,
    input FMC20N,
    input FMC20P,
    input FMC21N,
    input FMC21P,
    input FMC22N,
    input FMC22P,
    input FMC23N,
    input FMC23P,
    input FMC24N,
    input FMC24P,
    input FMC25N,
    input FMC25P,
    input FMC26N,
    input FMC26P,
    input FMC27N,
    input FMC27P,
    input FMC28N,
    input FMC28P,
    input FMC29N,
    input FMC29P,
    input FMC30N,
    input FMC30P,
    input FMC31N,
    input FMC31P,
    input FMC32N,
    input FMC32P,
    input FMC33N,
    input FMC33P,
    input FMC00CCN,
    input FMC00CCP,
    input FMC01CCN,
    input FMC01CCP,
    input FMC17CCN,
    input FMC17CCP,
    input FMC18CCN,
    input FMC18CCP,
    input FMCCLK0M2CN,
    input FMCCLK0M2CP,
    input FMCCLK1M2CN,
    input FMCCLK1M2CP,   
    // Output Channels on Connector C
    output C7,
    output C6,
    output C5,
    output C4,
    output C3,
    output C2,
    output C1,
    output C0,
    output [2047:0] reg_ro_out
    );
    //assign LED3 = A0; //1'b1;//IOB_D23_SC7_BTN3_N;
    //assign LED2 = A1;//1'b0;
    //assign C0 = A0 & A1;
   // assign D22 = 1'b0;
   // assign D20 = 1'b1;
   // assign D18 = 1'bz;
   reg [26:0] count=0; //Max is 134M 
    
   always @(posedge Clk50) begin // 50MHz Clk
        count<=count+1;
        // The MSB should blink every 2.5 seconds.
   end
   /*
   assign reg_ro_out[0] = count[26];
   assign reg_ro_out[1] = count[25];
   assign reg_ro_out[2] = count[24];
   assign reg_ro_out[3] = count[23];
   assign reg_ro_out[4] = count[22];
   assign reg_ro_out[5] = count[21];
   assign reg_ro_out[6] = count[20];
   assign reg_ro_out[7] = count[19];
   assign reg_ro_out[8] = count[18];
   assign reg_ro_out[9] = count[17];
   assign reg_ro_out[10] = count[16];
   assign reg_ro_out[11] = count[15];
   assign reg_ro_out[12] = count[14];
   assign reg_ro_out[13] = count[13];
   assign reg_ro_out[14] = count[12];
   assign reg_ro_out[15] = count[11];
   assign reg_ro_out[16] = count[10];
   assign reg_ro_out[17] = count[9];
   assign reg_ro_out[18] = count[8];
   assign reg_ro_out[19] = count[7];
   assign reg_ro_out[20] = count[6];
   assign reg_ro_out[21] = count[5];
   assign reg_ro_out[22] = count[4];
   assign reg_ro_out[23] = count[3];
   assign reg_ro_out[24] = count[2];
   assign reg_ro_out[25] = count[1];
   assign reg_ro_out[26] = count[0];*/
   //assign reg_ro_out[31:0] = 32'hDACECAFE;
   //assign reg_ro_out[63:32] = 32'hDACECAFE ;
   //assign reg_ro_out[94:63] = 32'hDACECAFE ;
   assign reg_ro_out [ 0 * 32 +  31 : 0 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 1 * 32 +  31 : 1 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 2 * 32 +  31 : 2 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 3 * 32 +  31 : 3 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 4 * 32 +  31 : 4 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 5 * 32 +  31 : 5 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 6 * 32 +  31 : 6 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 7 * 32 +  31 : 7 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 8 * 32 +  31 : 8 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 9 * 32 +  31 : 9 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 10 * 32 +  31 : 10 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 11 * 32 +  31 : 11 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 12 * 32 +  31 : 12 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 13 * 32 +  31 : 13 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 14 * 32 +  31 : 14 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 15 * 32 +  31 : 15 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 16 * 32 +  31 : 16 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 17 * 32 +  31 : 17 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 18 * 32 +  31 : 18 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 19 * 32 +  31 : 19 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 20 * 32 +  31 : 20 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 21 * 32 +  31 : 21 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 22 * 32 +  31 : 22 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 23 * 32 +  31 : 23 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 24 * 32 +  31 : 24 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 25 * 32 +  31 : 25 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 26 * 32 +  31 : 26 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 27 * 32 +  31 : 27 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 28 * 32 +  31 : 28 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 29 * 32 +  31 : 29 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 30 * 32 +  31 : 30 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 31 * 32 +  31 : 31 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 32 * 32 +  31 : 32 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 33 * 32 +  31 : 33 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 34 * 32 +  31 : 34 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 35 * 32 +  31 : 35 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 36 * 32 +  31 : 36 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 37 * 32 +  31 : 37 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 38 * 32 +  31 : 38 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 39 * 32 +  31 : 39 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 40 * 32 +  31 : 40 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 41 * 32 +  31 : 41 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 42 * 32 +  31 : 42 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 43 * 32 +  31 : 43 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 44 * 32 +  31 : 44 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 45 * 32 +  31 : 45 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 46 * 32 +  31 : 46 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 47 * 32 +  31 : 47 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 48 * 32 +  31 : 48 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 49 * 32 +  31 : 49 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 50 * 32 +  31 : 50 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 51 * 32 +  31 : 51 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 52 * 32 +  31 : 52 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 53 * 32 +  31 : 53 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 54 * 32 +  31 : 54 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 55 * 32 +  31 : 55 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 56 * 32 +  31 : 56 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 57 * 32 +  31 : 57 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 58 * 32 +  31 : 58 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 59 * 32 +  31 : 59 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 60 * 32 +  31 : 60 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 61 * 32 +  31 : 61 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 62 * 32 +  31 : 62 * 32 +  0] = 32'hdeadbeef;
   assign reg_ro_out [ 63 * 32 +  31 : 63 * 32 +  0] = 32'hdeadbeef;
   assign LED1 = count[24];
   assign LED2 = count[25];
   assign LED3 = count[26]; // MSB
endmodule
