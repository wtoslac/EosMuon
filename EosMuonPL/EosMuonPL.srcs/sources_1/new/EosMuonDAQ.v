`timescale 1ns / 1ps

module EosMuonDAQ(
    input         Clk50,
    input         Clk100,
    output  [2:0] LED,

    input  [25:0] IOA,
    input  [25:0] IOB,
    input  [35:0] FMCN,
    input  [35:0] FMCP,
    input   [7:0] IOC,
    input   [3:0] IOE,             // use input unless truly bidirectional
    input         IOD7,
    output [2047:0] reg_ro_out
);

    // === Registers ===
    reg  [54:0] MuonCounter     = 55'd0;
    reg         PTBTrig         = 1'b0;
    reg   [7:0] SignalA         = 8'd0;
    reg  [63:0] SignalB         = 64'd0;
    reg  [63:0] SignalC         = 64'd0;
    reg [1919:0] snapshot_stack = {1920{1'b0}};

    // Synchronize IOD7 to Clk100 and detect rising edge ---
    reg iod7_ff1 = 1'b0, iod7_ff2 = 1'b0;
    always @(posedge Clk100) begin
        iod7_ff1 <= IOD7;     // sync stage 1
        iod7_ff2 <= iod7_ff1; // sync stage 2
    end
    wire triggered = (iod7_ff1 & ~iod7_ff2);  // rising edge of IOD7

    // === Pack current frame (192 bits) ===
    wire [191:0] snapshot_frame = {
        SignalC,              // [191:128]
        SignalB,              // [127:64]
        SignalA,              // [63:56]
        PTBTrig,              // [55]
        MuonCounter           // [54:0]
    };

    // === Sequential logic ===
    always @(posedge Clk100) begin
        // free-running counter
        MuonCounter <= MuonCounter + 1'b1;

        // capture & stack push only on IOD7 rising edge
        if (triggered) begin
            PTBTrig <= iod7_ff1; // will be 1 on a rising edge
            SignalA <= IOC[7:0];

            SignalB[3:0]   <= IOE[3:0];
            SignalB[39:4]  <= FMCP[35:0];
            SignalB[63:40] <= FMCN[23:0];

            SignalC[11:0]  <= FMCN[35:24];
            SignalC[37:12] <= IOB[25:0];
            SignalC[63:38] <= IOA[25:0];

            snapshot_stack <= { snapshot_stack[1919-192:0], snapshot_frame };
        end
    end

    // === LED blink indicators ===
    assign LED[0] = MuonCounter[24]; // ~0.34 s
    assign LED[1] = MuonCounter[25]; // ~0.67 s
    assign LED[2] = MuonCounter[26]; // ~1.34 s

    // === Fully driven output: 1920 bits data + 128 bits zero padding ===
    assign reg_ro_out = { 128'd0, snapshot_stack };

endmodule
