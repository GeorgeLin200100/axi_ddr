`timescale 1ps/1ps

module pp_buffer_ddr_wrapper_top 
(
    input wire [3 : 0] c0_ddr4_s_axi_awid,
    input wire [28 : 0] c0_ddr4_s_axi_awaddr,
    input wire [7 : 0] c0_ddr4_s_axi_awlen,
    input wire [2 : 0] c0_ddr4_s_axi_awsize,
    input wire [1 : 0] c0_ddr4_s_axi_awburst,
    input wire [0 : 0] c0_ddr4_s_axi_awlock,
    input wire [3 : 0] c0_ddr4_s_axi_awcache,
    input wire [2 : 0] c0_ddr4_s_axi_awprot,
    input wire [3 : 0] c0_ddr4_s_axi_awqos,
    input wire c0_ddr4_s_axi_awvalid,
    output wire c0_ddr4_s_axi_awready,
    input wire [63 : 0] c0_ddr4_s_axi_wdata,
    input wire [7 : 0] c0_ddr4_s_axi_wstrb,
    input wire c0_ddr4_s_axi_wlast,
    input wire c0_ddr4_s_axi_wvalid,
    output wire c0_ddr4_s_axi_wready,
    input wire c0_ddr4_s_axi_bready,
    output wire [3 : 0] c0_ddr4_s_axi_bid,
    output wire [1 : 0] c0_ddr4_s_axi_bresp,
    output wire c0_ddr4_s_axi_bvalid,
    input wire [3 : 0] c0_ddr4_s_axi_arid,
    input wire [28 : 0] c0_ddr4_s_axi_araddr,
    input wire [7 : 0] c0_ddr4_s_axi_arlen,
    input wire [2 : 0] c0_ddr4_s_axi_arsize,
    input wire [1 : 0] c0_ddr4_s_axi_arburst,
    input wire [0 : 0] c0_ddr4_s_axi_arlock,
    input wire [3 : 0] c0_ddr4_s_axi_arcache,
    input wire [2 : 0] c0_ddr4_s_axi_arprot,
    input wire [3 : 0] c0_ddr4_s_axi_arqos,
    input wire c0_ddr4_s_axi_arvalid,
    output wire c0_ddr4_s_axi_arready,
    input wire c0_ddr4_s_axi_rready,
    output wire c0_ddr4_s_axi_rlast,
    output wire c0_ddr4_s_axi_rvalid,
    output wire [1 : 0] c0_ddr4_s_axi_rresp,
    output wire [3 : 0] c0_ddr4_s_axi_rid,
    output wire [63 : 0] c0_ddr4_s_axi_rdata,
    output clk,
    output rst_n,
    output init_calib_complete
);

    wire sys_rst; //Common port for all controllers

    wire                c0_init_calib_complete;
    wire                c0_data_compare_error;
    wire                c0_sys_clk_p;
    wire                c0_sys_clk_n;
    wire                c0_ddr4_act_n;
    wire [16:0]          c0_ddr4_adr;
    wire [1:0]            c0_ddr4_ba;
    wire [1:0]            c0_ddr4_bg;
    wire [0:0]            c0_ddr4_cke;
    wire [0:0]            c0_ddr4_odt;
    wire [0:0]            c0_ddr4_cs_n;
    wire [0:0]                 c0_ddr4_ck_t;
    wire [0:0]                c0_ddr4_ck_c;
    wire                  c0_ddr4_reset_n;
    wire  [0:0]            c0_ddr4_dm_dbi_n;
    wire  [7:0]            c0_ddr4_dq;
    wire  [0:0]            c0_ddr4_dqs_t;
    wire  [0:0]            c0_ddr4_dqs_c;



    ddr4_0 ddr4_0 (
  .c0_init_calib_complete(init_calib_complete),    // output wire c0_init_calib_complete
  .dbg_clk(dbg_clk),                                  // output wire dbg_clk
  .c0_sys_clk_p(c0_sys_clk_p),                        // input wire c0_sys_clk_p
  .c0_sys_clk_n(c0_sys_clk_n),                        // input wire c0_sys_clk_n
  .dbg_bus(dbg_bus),                                  // output wire [511 : 0] dbg_bus
  .c0_ddr4_adr(c0_ddr4_adr),                          // output wire [16 : 0] c0_ddr4_adr
  .c0_ddr4_ba(c0_ddr4_ba),                            // output wire [1 : 0] c0_ddr4_ba
  .c0_ddr4_cke(c0_ddr4_cke),                          // output wire [0 : 0] c0_ddr4_cke
  .c0_ddr4_cs_n(c0_ddr4_cs_n),                        // output wire [0 : 0] c0_ddr4_cs_n
  .c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n),                // inout wire [0 : 0] c0_ddr4_dm_dbi_n
  .c0_ddr4_dq(c0_ddr4_dq),                            // inout wire [7 : 0] c0_ddr4_dq
  .c0_ddr4_dqs_c(c0_ddr4_dqs_c),                      // inout wire [0 : 0] c0_ddr4_dqs_c
  .c0_ddr4_dqs_t(c0_ddr4_dqs_t),                      // inout wire [0 : 0] c0_ddr4_dqs_t
  .c0_ddr4_odt(c0_ddr4_odt),                          // output wire [0 : 0] c0_ddr4_odt
  .c0_ddr4_bg(c0_ddr4_bg),                            // output wire [1 : 0] c0_ddr4_bg
  .c0_ddr4_reset_n(c0_ddr4_reset_n),                  // output wire c0_ddr4_reset_n
  .c0_ddr4_act_n(c0_ddr4_act_n),                      // output wire c0_ddr4_act_n
  .c0_ddr4_ck_c(c0_ddr4_ck_c),                        // output wire [0 : 0] c0_ddr4_ck_c
  .c0_ddr4_ck_t(c0_ddr4_ck_t),                        // output wire [0 : 0] c0_ddr4_ck_t
  .c0_ddr4_ui_clk(clk),                    // output wire c0_ddr4_ui_clk
  .c0_ddr4_ui_clk_sync_rst(),  // output wire c0_ddr4_ui_clk_sync_rst
  .c0_ddr4_aresetn(rst_n),                  // input wire c0_ddr4_aresetn
  .c0_ddr4_s_axi_awid(c0_ddr4_s_axi_awid),            // input wire [3 : 0] c0_ddr4_s_axi_awid
  .c0_ddr4_s_axi_awaddr(c0_ddr4_s_axi_awaddr),        // input wire [28 : 0] c0_ddr4_s_axi_awaddr
  .c0_ddr4_s_axi_awlen(c0_ddr4_s_axi_awlen),          // input wire [7 : 0] c0_ddr4_s_axi_awlen
  .c0_ddr4_s_axi_awsize(c0_ddr4_s_axi_awsize),        // input wire [2 : 0] c0_ddr4_s_axi_awsize
  .c0_ddr4_s_axi_awburst(c0_ddr4_s_axi_awburst),      // input wire [1 : 0] c0_ddr4_s_axi_awburst
  .c0_ddr4_s_axi_awlock(c0_ddr4_s_axi_awlock),        // input wire [0 : 0] c0_ddr4_s_axi_awlock
  .c0_ddr4_s_axi_awcache(c0_ddr4_s_axi_awcache),      // input wire [3 : 0] c0_ddr4_s_axi_awcache
  .c0_ddr4_s_axi_awprot(c0_ddr4_s_axi_awprot),        // input wire [2 : 0] c0_ddr4_s_axi_awprot
  .c0_ddr4_s_axi_awqos(c0_ddr4_s_axi_awqos),          // input wire [3 : 0] c0_ddr4_s_axi_awqos
  .c0_ddr4_s_axi_awvalid(c0_ddr4_s_axi_awvalid),      // input wire c0_ddr4_s_axi_awvalid
  .c0_ddr4_s_axi_awready(c0_ddr4_s_axi_awready),      // output wire c0_ddr4_s_axi_awready
  .c0_ddr4_s_axi_wdata(c0_ddr4_s_axi_wdata),          // input wire [63 : 0] c0_ddr4_s_axi_wdata
  .c0_ddr4_s_axi_wstrb(c0_ddr4_s_axi_wstrb),          // input wire [7 : 0] c0_ddr4_s_axi_wstrb
  .c0_ddr4_s_axi_wlast(c0_ddr4_s_axi_wlast),          // input wire c0_ddr4_s_axi_wlast
  .c0_ddr4_s_axi_wvalid(c0_ddr4_s_axi_wvalid),        // input wire c0_ddr4_s_axi_wvalid
  .c0_ddr4_s_axi_wready(c0_ddr4_s_axi_wready),        // output wire c0_ddr4_s_axi_wready
  .c0_ddr4_s_axi_bready(c0_ddr4_s_axi_bready),        // input wire c0_ddr4_s_axi_bready
  .c0_ddr4_s_axi_bid(c0_ddr4_s_axi_bid),              // output wire [3 : 0] c0_ddr4_s_axi_bid
  .c0_ddr4_s_axi_bresp(c0_ddr4_s_axi_bresp),          // output wire [1 : 0] c0_ddr4_s_axi_bresp
  .c0_ddr4_s_axi_bvalid(c0_ddr4_s_axi_bvalid),        // output wire c0_ddr4_s_axi_bvalid
  .c0_ddr4_s_axi_arid(c0_ddr4_s_axi_arid),            // input wire [3 : 0] c0_ddr4_s_axi_arid
  .c0_ddr4_s_axi_araddr(c0_ddr4_s_axi_araddr),        // input wire [28 : 0] c0_ddr4_s_axi_araddr
  .c0_ddr4_s_axi_arlen(c0_ddr4_s_axi_arlen),          // input wire [7 : 0] c0_ddr4_s_axi_arlen
  .c0_ddr4_s_axi_arsize(c0_ddr4_s_axi_arsize),        // input wire [2 : 0] c0_ddr4_s_axi_arsize
  .c0_ddr4_s_axi_arburst(c0_ddr4_s_axi_arburst),      // input wire [1 : 0] c0_ddr4_s_axi_arburst
  .c0_ddr4_s_axi_arlock(c0_ddr4_s_axi_arlock),        // input wire [0 : 0] c0_ddr4_s_axi_arlock
  .c0_ddr4_s_axi_arcache(c0_ddr4_s_axi_arcache),      // input wire [3 : 0] c0_ddr4_s_axi_arcache
  .c0_ddr4_s_axi_arprot(c0_ddr4_s_axi_arprot),        // input wire [2 : 0] c0_ddr4_s_axi_arprot
  .c0_ddr4_s_axi_arqos(c0_ddr4_s_axi_arqos),          // input wire [3 : 0] c0_ddr4_s_axi_arqos
  .c0_ddr4_s_axi_arvalid(c0_ddr4_s_axi_arvalid),      // input wire c0_ddr4_s_axi_arvalid
  .c0_ddr4_s_axi_arready(c0_ddr4_s_axi_arready),      // output wire c0_ddr4_s_axi_arready
  .c0_ddr4_s_axi_rready(c0_ddr4_s_axi_rready),        // input wire c0_ddr4_s_axi_rready
  .c0_ddr4_s_axi_rlast(c0_ddr4_s_axi_rlast),          // output wire c0_ddr4_s_axi_rlast
  .c0_ddr4_s_axi_rvalid(c0_ddr4_s_axi_rvalid),        // output wire c0_ddr4_s_axi_rvalid
  .c0_ddr4_s_axi_rresp(c0_ddr4_s_axi_rresp),          // output wire [1 : 0] c0_ddr4_s_axi_rresp
  .c0_ddr4_s_axi_rid(c0_ddr4_s_axi_rid),              // output wire [3 : 0] c0_ddr4_s_axi_rid
  .c0_ddr4_s_axi_rdata(c0_ddr4_s_axi_rdata),          // output wire [63 : 0] c0_ddr4_s_axi_rdata
  .sys_rst(sys_rst)                                  // input wire sys_rst
);

     pp_buffer_ddr_wrapper u_pp_buffer_ddr_wrapper (
        .sys_rst(sys_rst),
        .c0_sys_clk_p(c0_sys_clk_p),
        .c0_sys_clk_n(c0_sys_clk_n),
        .c0_ddr4_dq(c0_ddr4_dq),
        .c0_ddr4_dqs_c(c0_ddr4_dqs_c),
        .c0_ddr4_dqs_t(c0_ddr4_dqs_t),
        .c0_ddr4_adr(c0_ddr4_adr),
        .c0_ddr4_ba(c0_ddr4_ba),
        .c0_ddr4_bg(c0_ddr4_bg),
        .c0_ddr4_reset_n(c0_ddr4_reset_n),
        .c0_ddr4_act_n(c0_ddr4_act_n),
        .c0_ddr4_ck_t(c0_ddr4_ck_t),
        .c0_ddr4_ck_c(c0_ddr4_ck_c),
        .c0_ddr4_cke(c0_ddr4_cke),
        .c0_ddr4_cs_n(c0_ddr4_cs_n),
        .c0_ddr4_dm_dbi_n(c0_ddr4_dm_dbi_n),
        .c0_ddr4_odt(c0_ddr4_odt)
     );

endmodule