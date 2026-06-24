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
    input [3:0] IOE,
    output[6:0] IOD,
    input IOD7,
    // PS accessible bits: two 2048-bit banks = 64 x 64-bit words total.
    output [2047:0] reg_ro_out,
    output [2047:0] reg_ro_out1,
    input [2047:0] reg_rw_in     // PS-written control bank
    );


    wire fmc35_se; // Single Ended FMC35 signal.
    wire fmc35_clk; // FMC35 Clock Signal
    IBUFDS #(.DIFF_TERM("TRUE"),.IBUF_LOW_PWR("FALSE")) // IBUFDS Module and Parameters
        IBUFDS_FMC35 (.I (FMCP[35]),.IB(FMCN[35]),.O (fmc35_se)); // IBUFDS_FMC35 Instance

    BUFG BUFG_FMC35 (.I(fmc35_se),.O(fmc35_clk)); // Buffer onto global clock net for low-skew distribution


    reg [54:0] ptb_count = 0; // This is the FMC35 62.5MHz Counter.
    always @(posedge fmc35_clk) begin
        ptb_count <= ptb_count + 1;
    end


    // =========================================================
    // Synchronize IOD7 to Clk100, detect rising edge
    // =========================================================
    reg iod7_ff1 = 1'b0, iod7_ff2 = 1'b0;
    always @(posedge Clk100) begin
        iod7_ff1 <= IOD7;
        iod7_ff2 <= iod7_ff1;
    end
    wire triggered = iod7_ff1 & ~iod7_ff2;  // rising edge
    
    reg req_tgl     = 0; // This is the request toggle for the 100MHz Clock. Resets at 1Hz.
    //reg [31:0] div  = 0;
    always @(posedge Clk100) begin
      //  div <= div + 1;
       // if (div == 100_000_000 - 1) begin
        //    div     <= 0;
         //   req_tgl <= ~req_tgl;
        //end
        if (triggered) req_tgl <= ~req_tgl;
    end

    reg [2:0] req_sync = 0; // Sync request toggle into fmc35_clk domain
    always @(posedge fmc35_clk) req_sync <= {req_sync[1:0], req_tgl};
    wire req_seen = req_sync[2] ^ req_sync[1];


    reg [54:0] ptb_latched = 55'd0; // FMC35 Counter that can be used in 100MHz Domain. 
    reg        ack_tgl     = 0;
    always @(posedge fmc35_clk) begin
        if (req_seen) begin
            ptb_latched <= ptb_count;
            ack_tgl     <= ~ack_tgl;
        end
    end

    reg [2:0] ack_sync = 0;   // Sync ack toggle into Clk100 domain
    always @(posedge Clk100) ack_sync <= {ack_sync[1:0], ack_tgl};
    wire ack_seen = ack_sync[2] ^ ack_sync[1];


    // Count how many of the input vectors have 2+ bits LOW
    wire any2_IOA  = (|(~IOA[25:0] & (~IOA[25:0] - 1)));  // true if 2+ bits low
    wire any2_IOB  = (|(~IOB[25:0] & (~IOB[25:0] - 1)));
    wire any2_FMCN = (|(~FMCN[34:0] & (~FMCN[34:0] - 1)));
    wire any2_FMCP = (|(~FMCP[34:0] & (~FMCP[34:0] - 1)));
    wire any2_IOE  = (|(~IOE[3:0] & (~IOE[3:0] - 1)));
    wire any2_IOC  = (|(~IOC[7:0] & (~IOC[7:0] - 1)));

    wire exactly1_IOA  = (|(~IOA[25:0]))  & ~any2_IOA;
    wire exactly1_IOB  = (|(~IOB[25:0]))  & ~any2_IOB;
    wire exactly1_FMCN = (|(~FMCN[34:0])) & ~any2_FMCN;
    wire exactly1_FMCP = (|(~FMCP[34:0])) & ~any2_FMCP;
    wire exactly1_IOE  = (|(~IOE[3:0]))   & ~any2_IOE;
    wire exactly1_IOC  = (|(~IOC[7:0]))   & ~any2_IOC;
    
    // Sum how many vectors have exactly 1 high bit
    wire [2:0] ones_count = exactly1_IOA + exactly1_IOB + exactly1_FMCN
                          + exactly1_FMCP + exactly1_IOE + exactly1_IOC;
    
    // [57]: high if exactly 2 vectors each have exactly 1 high input
    // [56]: high if 3 or more vectors each have exactly 1 high input  
    wire DoubleHits = (ones_count == 3'd2);
    wire TripleHits = (ones_count >= 3'd3);
    
    // Adding the assignments to output the double and triple hits signal to the PTB.
    assign IOD[3:0] = 4'b0;  // unused outputs
    assign IOD[6]   = 1'b0;  // unused output
    assign IOD[4] = DoubleHits; // IOD[4] is the bottom right LEMO00 Connector
    assign IOD[5] = TripleHits; // IOD[5] is the Top right LEMO00 Connector
    
    // Build the 192-bits frame for each event.
    wire [191:0] snapshot_frame = {
        ~IOA[25:0],        // [191:166]
        ~IOB[25:0],        // [165:140]
        ~FMCN[34:0],       // [139:105]
        ~FMCP[34:0],       // [104:70]
        ~IOE[3:0],         // [69:66]
        ~IOC[7:0],         // [65:58]
        DoubleHits,        // [57] exactly 2 hits 
        TripleHits,        // [56] three or more hits
        iod7_ff1,         // [55] PTB Trigger bits
        ptb_latched       // [54:0] Counter off PTB Clock
    };
 
    // =========================================================
    // Event FIFO: buffers complete 192-bit events before stack update
    // =========================================================
    wire [191:0] fifo_dout;
    wire [191:0] fifo_din;
    wire         fifo_wr_en;
    reg          fifo_rd_en = 1'b0;
    wire         fifo_full;
    wire         fifo_empty;
    wire         fifo_overflow;
    wire         fifo_wr_rst_busy;
    wire         fifo_rd_rst_busy;
    
    reg [191:0] event_reg = 192'd0;
    reg         event_valid = 1'b0;
    
    always @(posedge Clk100) begin
        event_valid <= 1'b0;
    
        if (ack_seen) begin
            event_reg   <= snapshot_frame;
            event_valid <= 1'b1;
        end
    end
    
    assign fifo_din   = event_reg;
    assign fifo_wr_en = event_valid && !fifo_full && !fifo_wr_rst_busy;
    
    event192_fifo event_fifo_i (
        .clk         (Clk100),
        .srst        (1'b0),
    
        .din         (fifo_din),
        .wr_en       (fifo_wr_en),
        .rd_en       (fifo_rd_en),
    
        .dout        (fifo_dout),
        .full        (fifo_full),
        .overflow    (fifo_overflow),
        .empty       (fifo_empty),
        .wr_rst_busy (fifo_wr_rst_busy),
        .rd_rst_busy (fifo_rd_rst_busy)
    );
 
    // Add a check to see if the previous trigger is more than 10s old.
    localparam [54:0] TIMEOUT_TICKS = 55'd625_000_000; // 10s @ 62.5MHz
    reg [54:0] ptb_latched_prev = 55'd0; // previous latched timestamp
    localparam integer EVENT_W      = 192;
    localparam integer STACK_DEPTH  = 20;
    localparam [4:0] STACK_DEPTH_5 = 5'd20;
    localparam integer STACK_W      = EVENT_W * STACK_DEPTH; // 3840 bits
    
    reg [STACK_W-1:0] snapshot_stack = {STACK_W{1'b0}};
    reg [4:0] stack_count = 5'd0; // valid events in stack, 0..20
    wire [54:0] fifo_timestamp = fifo_dout[54:0];
    reg [31:0] stack_seq = 32'd0;

    wire [54:0] fifo_ptb_diff =
        (fifo_timestamp >= ptb_latched_prev) ?
            (fifo_timestamp - ptb_latched_prev) :
            (ptb_latched_prev - fifo_timestamp);
    
    wire ps_ack_toggle = reg_rw_in[0];

    reg ps_ack_toggle_d = 1'b0;
    wire ps_ack_seen = ps_ack_toggle ^ ps_ack_toggle_d;
    
    always @(posedge Clk100) begin
        ps_ack_toggle_d <= ps_ack_toggle;
    end

    
    always @(posedge Clk100) begin
        fifo_rd_en <= 1'b0;
    
        if (ps_ack_seen) begin
            // PS has consumed the visible stack.
            // Clear visible stack and wait for FIFO to refill it on later clocks.
            snapshot_stack <= {STACK_W{1'b0}};
            stack_count    <= 5'd0;
            stack_seq      <= stack_seq + 1'b1;
        end else if (!fifo_empty && !fifo_rd_rst_busy) begin
            fifo_rd_en <= 1'b1;
    
            if ((stack_count == 5'd0) || (fifo_ptb_diff > TIMEOUT_TICKS)) begin
                snapshot_stack <= { {(STACK_W-EVENT_W){1'b0}}, fifo_dout };
                stack_count    <= 5'd1;
            end else if (stack_count < STACK_DEPTH_5) begin
                snapshot_stack[stack_count*EVENT_W +: EVENT_W] <= fifo_dout;
                stack_count <= stack_count + 1'b1;
            end else begin
                snapshot_stack <= { fifo_dout, snapshot_stack[STACK_W-1:EVENT_W] };
                stack_count    <= STACK_DEPTH_5;
            end
    
            stack_seq <= stack_seq + 1'b1;
            ptb_latched_prev <= fifo_timestamp;
        end
    end

    // =========================================================
    // LED blink indicators (driven from ptb_latched)
    // =========================================================
    assign LED[0] = ptb_latched[24]; // ~0.34 s toggle
    assign LED[1] = ptb_latched[25]; // ~0.67 s toggle
    assign LED[2] = ptb_latched[26]; // ~1.34 s toggle

    // Output: 3840-bit stack split across two 2048-bit PS register banks.
    // reg_ro_out  contains snapshot_stack[2047:0].
    // reg_ro_out1 contains snapshot_stack[3839:2048] plus four 64-bit status words.
    wire [255:0] status_words = {
        64'd0,
        {32'd0, stack_seq},
        {59'd0, stack_count},
        {62'd0, fifo_full, fifo_empty}
    };
    assign reg_ro_out  = snapshot_stack[2047:0];
    assign reg_ro_out1 = { status_words, snapshot_stack[3839:2048] };
    
endmodule

/////////////////////////////////// For Calibrating the PMT Rates//////////////////////////
/*`timescale 1ns / 1ps

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
    
    // existing content unchanged up to the Synchronizers...
    //assign reg_ro_out [ 31+32*0 : 0+32*0] = 32'hdeadbeef; //this goes to 0x8002_0100
   
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
    reg [54:0] ptb_latched = 55'd0;
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
    
    /////////////////////////////For Eos Data Taking with Muon Paddles///////////
    ////////////////////////////// Pass Muon Signals Memory /////////////////////
        // === Registers ===
    //reg  [54:0] MuonCounter     = 55'd0;
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
        ptb_latched           // [54:0]
    };

    // === Sequential logic ===
    always @(posedge Clk100) begin
        // free-running counter
        //if (ack_seen)
        //ptb_latched_100 <= ptb_latched;
          //  MuonCounter <= ptb_latched;

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
    assign LED[0] = ptb_latched[24]; // ~0.34 s
    assign LED[1] = ptb_latched[25]; // ~0.67 s
    assign LED[2] = ptb_latched[26]; // ~1.34 s

    // === Fully driven output: 1920 bits data + 128 bits zero padding ===
    assign reg_ro_out = { 128'd0, snapshot_stack };
endmodule
*/    
    /////////////////////////////For Eos Data Taking with Muon Paddles///////////
    ////////////////////////////// Pass Muon Signals Memory /////////////////////
    
 
 
    /////////////////////////////For Calibrating Eos Thresholds and HV///////////
    /*
    // Capture latched value when ack arrives (latched is stable around ack)
    reg [31:0] ptb_latched_100 = 0;
    always @(posedge Clk100) begin
      if (ack_seen)
        ptb_latched_100 <= ptb_latched;
    end
    
    assign reg_ro_out[31:0] = ptb_latched_100;
    // Synchronizer for differential channel (after IBUFDS)
    
    //******************** Testing with Paddles by counting hits from them ******************************
     // Synchronizers for FMCP and FMCN signals
    reg [1:0] fmcp0_sync = 2'b11;
    reg [1:0] fmcp1_sync = 2'b11; // NEW for FMC_LA01_CC_P
    reg [1:0] fmcp2_sync = 2'b11; // NEW for FMC_LA02_P
    reg [1:0] fmcp3_sync = 2'b11; // NEW for FMC_LA03_P
    reg [1:0] fmcp4_sync = 2'b11; // NEW for FMC_LA04_P
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
    reg [1:0] fmcn1_sync = 2'b11; // NEW for FMC_LA01_CC_N
    reg [1:0] fmcn2_sync = 2'b11; // NEW for FMC_LA02_N
    reg [1:0] fmcn3_sync = 2'b11; // NEW for FMC_LA03_N
    reg [1:0] fmcn4_sync = 2'b11; // NEW for FMC_LA04_N
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
    // NEW IOA synchronizers for requested channels
    reg [1:0] ioa0_sync  = 2'b11;
    reg [1:0] ioa2_sync  = 2'b11;
    reg [1:0] ioa4_sync  = 2'b11;
    reg [1:0] ioa6_sync  = 2'b11;
    reg [1:0] ioa8_sync  = 2'b11;
    reg [1:0] ioa9_sync  = 2'b11;
    reg [1:0] ioa10_sync = 2'b11;
    reg [1:0] ioa11_sync = 2'b11;
    reg [1:0] ioa12_sync = 2'b11;
    reg [1:0] ioa13_sync = 2'b11;
    reg [1:0] ioa14_sync = 2'b11;
    reg [1:0] ioa15_sync = 2'b11;
    reg [1:0] ioa16_sync = 2'b11;
    reg [1:0] ioa17_sync = 2'b11;
    reg [1:0] ioa18_sync = 2'b11;
    reg [1:0] ioa19_sync = 2'b11;

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
    wire FMCP0Pulse, FMCP1Pulse, FMCP2Pulse, FMCP3Pulse, FMCP4Pulse, FMCP5Pulse, FMCP6Pulse, FMCP7Pulse, FMCP8Pulse, FMCP9Pulse, FMCP19Pulse, FMCP18Pulse, FMCP17Pulse, FMCP16Pulse, FMCP15Pulse;
    wire FMCN0Pulse, FMCN1Pulse, FMCN2Pulse, FMCN3Pulse, FMCN4Pulse, FMCN5Pulse, FMCN6Pulse, FMCN7Pulse, FMCN8Pulse, FMCN9Pulse, FMCN19Pulse, FMCN18Pulse, FMCN17Pulse, FMCN16Pulse, FMCN15Pulse;
    wire FMCP14Pulse, FMCN14Pulse, FMCP13Pulse, FMCN13Pulse, FMCP12Pulse, FMCN12Pulse, FMCP11Pulse, FMCN11Pulse, FMCP10Pulse, FMCN10Pulse, FMCP20Pulse;
    wire FMCN20Pulse, FMCP21Pulse, FMCN21Pulse, FMCP22Pulse, FMCN22Pulse, FMCP23Pulse, FMCN23Pulse, FMCN27Pulse, FMCP27Pulse, FMCN26Pulse, FMCP26Pulse;
    wire FMCN25Pulse, FMCP25Pulse, FMCN24Pulse, FMCP24Pulse, FMCP28Pulse, FMCN28Pulse, FMCP29Pulse, FMCN29Pulse, FMCN31Pulse, FMCP31Pulse, FMCN30Pulse;
    wire FMCP30Pulse, FMCP32Pulse, FMCP33Pulse, FMCN33Pulse, FMCN32Pulse, IOA22Pulse, IOA20Pulse, 
         IOA0Pulse, IOA2Pulse, IOA4Pulse, IOA6Pulse, IOA8Pulse, IOA9Pulse, IOA10Pulse, IOA11Pulse,
         IOA12Pulse, IOA13Pulse, IOA14Pulse, IOA15Pulse, IOA16Pulse, IOA17Pulse, IOA18Pulse, IOA19Pulse,
         IOC0Pulse, IOC1Pulse, IOC2Pulse, IOC3Pulse;
    wire IOC4Pulse, IOC5Pulse, IOC6Pulse, IOC7Pulse,IOE0Pulse, IOE1Pulse, IOB13Pulse, IOB15Pulse, IOB17Pulse, IOB19Pulse, IOB21Pulse, IOB23Pulse;
    wire IOA7Pulse, IOA5Pulse, IOA3Pulse, IOA1Pulse, IOB6Pulse, IOB4Pulse, IOB2Pulse, IOB0Pulse, IOB1Pulse, IOB3Pulse, IOB5Pulse, IOB7Pulse;
    wire IOB9Pulse, IOB11Pulse, IOA21Pulse, IOA23Pulse, IOB22Pulse, IOB20Pulse, IOB18Pulse, IOB16Pulse, IOB14Pulse, IOB12Pulse, IOB10Pulse, IOB8Pulse;
    

    

    // Synchronize inputs to system clock
    always @(posedge Clk100) begin
       // fmcp35_sync <= {fmcp35_sync[0], FMCP[35]}; // Try single ended on PTB Clock
       // fmcp35_sync <= {fmcp35_sync[0],fmc35_se}; // use differential for PTB Clock.

        fmcp0_sync <= {fmcp0_sync[0], FMCP[0]};
        fmcp1_sync <= {fmcp1_sync[0], FMCP[1]}; // NEW
        fmcp2_sync <= {fmcp2_sync[0], FMCP[2]}; // NEW
        fmcp3_sync <= {fmcp3_sync[0], FMCP[3]}; // NEW
        fmcp4_sync <= {fmcp4_sync[0], FMCP[4]}; // NEW
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
        fmcn1_sync <= {fmcn1_sync[0], FMCN[1]}; // NEW
        fmcn2_sync <= {fmcn2_sync[0], FMCN[2]}; // NEW
        fmcn3_sync <= {fmcn3_sync[0], FMCN[3]}; // NEW
        fmcn4_sync <= {fmcn4_sync[0], FMCN[4]}; // NEW
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
        // NEW IOA synchronizers
        ioa0_sync   <= {ioa0_sync[0],   IOA[0]};
        ioa2_sync   <= {ioa2_sync[0],   IOA[2]};
        ioa4_sync   <= {ioa4_sync[0],   IOA[4]};
        ioa6_sync   <= {ioa6_sync[0],   IOA[6]};
        ioa8_sync   <= {ioa8_sync[0],   IOA[8]};
        ioa9_sync   <= {ioa9_sync[0],   IOA[9]};
        ioa10_sync  <= {ioa10_sync[0],  IOA[10]};
        ioa11_sync  <= {ioa11_sync[0],  IOA[11]};
        ioa12_sync  <= {ioa12_sync[0],  IOA[12]};
        ioa13_sync  <= {ioa13_sync[0],  IOA[13]};
        ioa14_sync  <= {ioa14_sync[0],  IOA[14]};
        ioa15_sync  <= {ioa15_sync[0],  IOA[15]};
        ioa16_sync  <= {ioa16_sync[0],  IOA[16]};
        ioa17_sync  <= {ioa17_sync[0],  IOA[17]};
        ioa18_sync  <= {ioa18_sync[0],  IOA[18]};
        ioa19_sync  <= {ioa19_sync[0],  IOA[19]};

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
    //assign FMCP35Pulse = (fmcp35_sync[1] & ~fmcp35_sync[0]);
    
    assign FMCP0Pulse = (fmcp0_sync[1] & ~fmcp0_sync[0]);
    assign FMCP1Pulse = (fmcp1_sync[1] & ~fmcp1_sync[0]); // NEW
    assign FMCP2Pulse = (fmcp2_sync[1] & ~fmcp2_sync[0]); // NEW
    assign FMCP3Pulse = (fmcp3_sync[1] & ~fmcp3_sync[0]); // NEW
    assign FMCP4Pulse = (fmcp4_sync[1] & ~fmcp4_sync[0]); // NEW
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
    assign FMCN1Pulse = (fmcn1_sync[1] & ~fmcn1_sync[0]); // NEW
    assign FMCN2Pulse = (fmcn2_sync[1] & ~fmcn2_sync[0]); // NEW
    assign FMCN3Pulse = (fmcn3_sync[1] & ~fmcn3_sync[0]); // NEW
    assign FMCN4Pulse = (fmcn4_sync[1] & ~fmcn4_sync[0]); // NEW
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
    // NEW IOA pulses
    assign IOA0Pulse   = (ioa0_sync[1]   & ~ioa0_sync[0]);
    assign IOA2Pulse   = (ioa2_sync[1]   & ~ioa2_sync[0]);
    assign IOA4Pulse   = (ioa4_sync[1]   & ~ioa4_sync[0]);
    assign IOA6Pulse   = (ioa6_sync[1]   & ~ioa6_sync[0]);
    assign IOA8Pulse   = (ioa8_sync[1]   & ~ioa8_sync[0]);
    assign IOA9Pulse   = (ioa9_sync[1]   & ~ioa9_sync[0]);
    assign IOA10Pulse  = (ioa10_sync[1]  & ~ioa10_sync[0]);
    assign IOA11Pulse  = (ioa11_sync[1]  & ~ioa11_sync[0]);
    assign IOA12Pulse  = (ioa12_sync[1]  & ~ioa12_sync[0]);
    assign IOA13Pulse  = (ioa13_sync[1]  & ~ioa13_sync[0]);
    assign IOA14Pulse  = (ioa14_sync[1]  & ~ioa14_sync[0]);
    assign IOA15Pulse  = (ioa15_sync[1]  & ~ioa15_sync[0]);
    assign IOA16Pulse  = (ioa16_sync[1]  & ~ioa16_sync[0]);
    assign IOA17Pulse  = (ioa17_sync[1]  & ~ioa17_sync[0]);
    assign IOA18Pulse  = (ioa18_sync[1]  & ~ioa18_sync[0]);
    assign IOA19Pulse  = (ioa19_sync[1]  & ~ioa19_sync[0]);
    
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
    assign IOB21Pulse  = (iob21_sync[1]  & ~iob21_sync[0]);
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
    //reg [31:0] nFMCP35Hits = 0; // For PTB CLock
    reg [31:0] nFMCP0Hits = 0,  nFMCP1Hits = 0, nFMCP2Hits = 0, nFMCP3Hits = 0, nFMCP4Hits = 0, nFMCP5Hits = 0,  nFMCP6Hits = 0,  nFMCP7Hits = 0,  nFMCP8Hits = 0,  nFMCP9Hits = 0;
    reg [31:0] nFMCP19Hits = 0, nFMCP18Hits = 0, nFMCP17Hits = 0, nFMCP16Hits = 0, nFMCP15Hits = 0, nFMCP14Hits = 0;
    reg [31:0] nFMCP13Hits = 0, nFMCP12Hits = 0, nFMCP11Hits = 0, nFMCP10Hits = 0, nFMCP20Hits = 0, nFMCP21Hits = 0;
    reg [31:0] nFMCP22Hits = 0, nFMCP23Hits = 0, nFMCP27Hits = 0, nFMCP26Hits = 0, nFMCP25Hits = 0, nFMCP24Hits = 0;
    reg [31:0] nFMCP28Hits = 0, nFMCP29Hits = 0, nFMCP31Hits = 0, nFMCP30Hits = 0, nFMCP32Hits = 0, nFMCP33Hits = 0;
    
    reg [31:0] nFMCN0Hits = 0,  nFMCN1Hits = 0, nFMCN2Hits = 0, nFMCN3Hits = 0, nFMCN4Hits = 0, nFMCN5Hits = 0,  nFMCN6Hits = 0,  nFMCN7Hits = 0,  nFMCN8Hits = 0,  nFMCN9Hits = 0;
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

    // NEW IOA counters for requested channels (D00, D02, D04, D06, D08, D09, D10, D11, D12, D13, D14, D15, D16, D17, D18, D19)
    reg [31:0] nIOA0Hits  = 0;
    reg [31:0] nIOA2Hits  = 0;
    reg [31:0] nIOA4Hits  = 0;
    reg [31:0] nIOA6Hits  = 0;
    reg [31:0] nIOA8Hits  = 0;
    reg [31:0] nIOA9Hits  = 0;
    reg [31:0] nIOA10Hits = 0;
    reg [31:0] nIOA11Hits = 0;
    reg [31:0] nIOA12Hits = 0;
    reg [31:0] nIOA13Hits = 0;
    reg [31:0] nIOA14Hits = 0;
    reg [31:0] nIOA15Hits = 0;
    reg [31:0] nIOA16Hits = 0;
    reg [31:0] nIOA17Hits = 0;
    reg [31:0] nIOA18Hits = 0;
    reg [31:0] nIOA19Hits = 0;
    
     // Increment counters on pulse
    always @(posedge Clk100) begin
        //if (FMCP35Pulse) nFMCP35Hits <= nFMCP35Hits + 1; // For PTB Clock
        
        if (FMCP0Pulse)   nFMCP0Hits   <= nFMCP0Hits + 1;
        if (FMCP1Pulse)   nFMCP1Hits   <= nFMCP1Hits + 1; // NEW
        if (FMCP2Pulse)   nFMCP2Hits   <= nFMCP2Hits + 1; // NEW
        if (FMCP3Pulse)   nFMCP3Hits   <= nFMCP3Hits + 1; // NEW
        if (FMCP4Pulse)   nFMCP4Hits   <= nFMCP4Hits + 1; // NEW
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
        if (FMCN1Pulse)   nFMCN1Hits   <= nFMCN1Hits + 1; // NEW
        if (FMCN2Pulse)   nFMCN2Hits   <= nFMCN2Hits + 1; // NEW
        if (FMCN3Pulse)   nFMCN3Hits   <= nFMCN3Hits + 1; // NEW
        if (FMCN4Pulse)   nFMCN4Hits   <= nFMCN4Hits + 1; // NEW
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
        
        // NEW IOA counters increments
        if (IOA0Pulse)   nIOA0Hits  <= nIOA0Hits + 1;
        if (IOA2Pulse)   nIOA2Hits  <= nIOA2Hits + 1;
        if (IOA4Pulse)   nIOA4Hits  <= nIOA4Hits + 1;
        if (IOA6Pulse)   nIOA6Hits  <= nIOA6Hits + 1;
        if (IOA8Pulse)   nIOA8Hits  <= nIOA8Hits + 1;
        if (IOA9Pulse)   nIOA9Hits  <= nIOA9Hits + 1;
        if (IOA10Pulse)  nIOA10Hits <= nIOA10Hits + 1;
        if (IOA11Pulse)  nIOA11Hits <= nIOA11Hits + 1;
        if (IOA12Pulse)  nIOA12Hits <= nIOA12Hits + 1;
        if (IOA13Pulse)  nIOA13Hits <= nIOA13Hits + 1;
        if (IOA14Pulse)  nIOA14Hits <= nIOA14Hits + 1;
        if (IOA15Pulse)  nIOA15Hits <= nIOA15Hits + 1;
        if (IOA16Pulse)  nIOA16Hits <= nIOA16Hits + 1;
        if (IOA17Pulse)  nIOA17Hits <= nIOA17Hits + 1;
        if (IOA18Pulse)  nIOA18Hits <= nIOA18Hits + 1;
        if (IOA19Pulse)  nIOA19Hits <= nIOA19Hits + 1;
        
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
   // assign reg_ro_out[31 + 32*0  : 32*0]   = nFMCP35Hits; // 0x8002_0100 // For PTB Clock 
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

    // NEW: map the 16 IOA counters requested into reg_ro_out1 at subsequent indices starting at 40
    assign reg_ro_out1[31 + 32*40 : 32*40] = nIOA0Hits;   // 0x8003_01A0
    assign reg_ro_out1[31 + 32*41 : 32*41] = nIOA2Hits;   // 0x8003_01A4
    assign reg_ro_out1[31 + 32*42 : 32*42] = nIOA4Hits;   // 0x8003_01A8
    assign reg_ro_out1[31 + 32*43 : 32*43] = nIOA6Hits;   // 0x8003_01AC
    assign reg_ro_out1[31 + 32*44 : 32*44] = nIOA8Hits;   // 0x8003_01B0
    assign reg_ro_out1[31 + 32*45 : 32*45] = nIOA9Hits;   // 0x8003_01B4
    assign reg_ro_out1[31 + 32*46 : 32*46] = nIOA10Hits;  // 0x8003_01B8
    assign reg_ro_out1[31 + 32*47 : 32*47] = nIOA11Hits;  // 0x8003_01BC
    assign reg_ro_out1[31 + 32*48 : 32*48] = nIOA12Hits;  // 0x8003_01C0
    assign reg_ro_out1[31 + 32*49 : 32*49] = nIOA13Hits;  // 0x8003_01C4
    assign reg_ro_out1[31 + 32*50 : 32*50] = nIOA14Hits;  // 0x8003_01C8
    assign reg_ro_out1[31 + 32*51 : 32*51] = nIOA15Hits;  // 0x8003_01CC
    assign reg_ro_out1[31 + 32*52 : 32*52] = nIOA16Hits;  // 0x8003_01D0
    assign reg_ro_out1[31 + 32*53 : 32*53] = nIOA17Hits;  // 0x8003_01D4
    assign reg_ro_out1[31 + 32*54 : 32*54] = nIOA18Hits;  // 0x8003_01D8
    assign reg_ro_out1[31 + 32*55 : 32*55] = nIOA19Hits;  // 0x8003_01DC
    
    assign reg_ro_out1[31 + 32*56 : 32*56] = nFMCP1Hits;  // 0x8003_01E0
    assign reg_ro_out1[31 + 32*57 : 32*57] = nFMCN1Hits;  // 0x8003_01E4
    assign reg_ro_out1[31 + 32*58 : 32*58] = nFMCP2Hits;  // 0x8003_01E8
    assign reg_ro_out1[31 + 32*59 : 32*59] = nFMCN2Hits;  // 0x8003_01EC
    assign reg_ro_out1[31 + 32*60 : 32*60] = nFMCP3Hits;  // 0x8003_01F0
    assign reg_ro_out1[31 + 32*61 : 32*61] = nFMCN3Hits;  // 0x8003_01F4
    assign reg_ro_out1[31 + 32*62 : 32*62] = nFMCP4Hits;  // 0x8003_01F8
    assign reg_ro_out1[31 + 32*63 : 32*63] = nFMCN4Hits;  // 0x8003_01FC
   // Testing the input from the PTB into Petalinux
   */
   
   /*
   reg [31:0] nIOD7=0; //Max is 4.3B
   reg IOD7reg;
   always @(posedge Clk100) begin // Input Trigger from the PTB.
        IOD7reg<=IOD7;
        if(~IOD7reg & IOD7)
            nIOD7<=nIOD7+1;
   end     
   assign reg_ro_out [31+32*2:0+32*2] = nIOD7[31:0];  //this goes to 0x8002_0108 (4Hex=32bit address later)
   
   
endmodule
*/
