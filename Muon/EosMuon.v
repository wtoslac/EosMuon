`timescale 1ns / 1ps

module EosMuon(
    output LED2,
    output LED3,
    output D22,
    output D20,
    output D18
    );
    assign LED3 = 1'b1;//IOB_D23_SC7_BTN3_N;
    assign LED2 = 1'b0;
    assign D22 = 1'b0;
    assign D20 = 1'b1;
    assign D18 = 1'bz;

endmodule
