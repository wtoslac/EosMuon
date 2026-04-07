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
    inout   [3:0] IOE,   
    inout   [6:0] IOD,
    input         IOD7,
    output [2047:0] reg_ro_out
);

    wire fmc35_se;
    wire fmc35_clk;

    IBUFDS #(
      .DIFF_TERM("TRUE"),
      .IBUF_LOW_PWR("FALSE")
    ) IBUFDS_FMC35 (
      .I (FMCP[35]),
      .IB(FMCN[35]),
      .O (fmc35_se)
    );
    
    BUFG BUFG_FMC35 (
      .I(fmc35_se),
      .O(fmc35_clk)
    );
    
    reg [31:0] ptb_count = 0;
    always @(posedge fmc35_clk) begin
        ptb_count <= ptb_count + 1;
    end
    
    // Clk100 domain: periodically request a snapshot
    reg [31:0] snap_100 = 0;
    reg        req_tgl  = 0;
    
    reg [31:0] div = 0;  // ~1 Hz at 100 MHz (adjust as you like)
    always @(posedge Clk100) begin
      div <= div + 1;
      if (div == 100_000_000-1) begin
        div     <= 0;
        req_tgl <= ~req_tgl;
      end
    end
    
    // Sync request toggle into fmc35_clk domain
    reg [2:0] req_sync = 0;
    always @(posedge fmc35_clk) req_sync <= {req_sync[1:0], req_tgl};
    wire req_seen = req_sync[2] ^ req_sync[1];
    
    // fmc35_clk domain: latch counter on request, toggle ack
    reg [54:0] ptb_latched = 0;
    reg        ack_tgl     = 0;
    always @(posedge fmc35_clk) begin
      if (req_seen) begin
        ptb_latched <= ptb_count;
        ack_tgl     <= ~ack_tgl;
      end
    end
    
    // Sync ack toggle + latched bus into Clk100 domain
    reg [2:0] ack_sync = 0;
    always @(posedge Clk100) ack_sync <= {ack_sync[1:0], ack_tgl};
    wire ack_seen = ack_sync[2] ^ ack_sync[1];
    
    // Capture latched value when ack arrives (latched is stable around ack)
    //reg [31:0] ptb_latched_100 = 0;
    //always @(posedge Clk100) begin
    //  if (ack_seen)
    //    ptb_latched_100 <= ptb_latched;
    //end
    //assign reg_ro_out[31:0] = ptb_latched_100;

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
        if (ack_seen)
        //ptb_latched_100 <= ptb_latched;
            MuonCounter <= ptb_latched;

        // capture & stack push only on IOD7 rising edge
        if (triggered) begin
            PTBTrig <= iod7_ff1; // will be 1 on a rising edge
            SignalA <= IOC[7:0];

            SignalB[3:0]   <= IOE[3:0];
            SignalB[38:4]  <= FMCP[34:0];
            SignalB[63:40] <= FMCN[23:0];

            SignalC[10:0]  <= FMCN[34:24];
            SignalC[37:11] <= IOB[25:0];
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
