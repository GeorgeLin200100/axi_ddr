`timescale 1ns / 1ps

module pp_buffer_top #(
    parameter BRAM0_DEPTH = 1024,
    parameter BRAM0_DW = 64,
    parameter BRAM1_DEPTH = 1024,
    parameter BRAM1_DW = 64,
    parameter BURST_LEN_WIDTH = 8,
    parameter NUM_BURST_WIDTH = 8,
    parameter DDR_ADDR_WIDTH = 29,
    parameter DDR_DW = 64,
    parameter BRAM0_ADDR_WIDTH = $clog2(BRAM0_DEPTH),
    parameter BRAM1_ADDR_WIDTH = $clog2(BRAM1_DEPTH)
)
(
    output clk,
    output rst_n,
    output init_calib_complete,

    input rd_start,
    input [BURST_LEN_WIDTH - 1 : 0] rd_burst_len,
    input [NUM_BURST_WIDTH - 1 : 0] rd_num_burst,
    input [DDR_ADDR_WIDTH - 1 : 0] rd_start_addr,    
    output rd_ready,
    output rd_done,
    input [BRAM0_ADDR_WIDTH - 1 : 0] rd_start_bram_addr,

//BRAM to OUT channel
    input bram0_r_en,
    input bram1_r_en,
    output [BRAM0_DW - 1 : 0] bram0_rdata,
    output [BRAM1_DW - 1 : 0] bram1_rdata,
    input [BRAM0_ADDR_WIDTH - 1 : 0] bram0_r_addr,
    input [BRAM1_ADDR_WIDTH - 1 : 0] bram1_r_addr
);

wire [3 : 0] c0_ddr4_s_axi_awid;
wire [28 : 0] c0_ddr4_s_axi_awaddr;
wire [7 : 0] c0_ddr4_s_axi_awlen;
wire [2 : 0] c0_ddr4_s_axi_awsize;
wire [1 : 0] c0_ddr4_s_axi_awburst;
wire [0 : 0] c0_ddr4_s_axi_awlock;
wire [3 : 0] c0_ddr4_s_axi_awcache;
wire [2 : 0] c0_ddr4_s_axi_awprot;
wire [3 : 0] c0_ddr4_s_axi_awqos;
wire c0_ddr4_s_axi_awvalid;
wire c0_ddr4_s_axi_awready;
wire [63 : 0] c0_ddr4_s_axi_wdata;
wire [7 : 0] c0_ddr4_s_axi_wstrb;
wire c0_ddr4_s_axi_wlast;
wire c0_ddr4_s_axi_wvalid;
wire c0_ddr4_s_axi_wready;
wire c0_ddr4_s_axi_bready;
wire [3 : 0] c0_ddr4_s_axi_bid;
wire [1 : 0] c0_ddr4_s_axi_bresp;
wire c0_ddr4_s_axi_bvalid;
wire [3 : 0] c0_ddr4_s_axi_arid;
wire [28 : 0] c0_ddr4_s_axi_araddr;
wire [7 : 0] c0_ddr4_s_axi_arlen;
wire [2 : 0] c0_ddr4_s_axi_arsize;
wire [1 : 0] c0_ddr4_s_axi_arburst;
wire [0 : 0] c0_ddr4_s_axi_arlock;
wire [3 : 0] c0_ddr4_s_axi_arcache;
wire [2 : 0] c0_ddr4_s_axi_arprot;
wire [3 : 0] c0_ddr4_s_axi_arqos;
wire c0_ddr4_s_axi_arvalid;
wire c0_ddr4_s_axi_arready;
wire c0_ddr4_s_axi_rready;
wire c0_ddr4_s_axi_rlast;
wire c0_ddr4_s_axi_rvalid;
wire [1 : 0] c0_ddr4_s_axi_rresp;
wire [3 : 0] c0_ddr4_s_axi_rid;
wire [63 : 0] c0_ddr4_s_axi_rdata;


pp_buffer_wrapper #(
.BRAM0_DEPTH(BRAM0_DEPTH),
.BRAM0_DW(BRAM0_DW),
.BRAM1_DEPTH(BRAM1_DEPTH),
.BRAM1_DW(BRAM1_DW),
.BURST_LEN_WIDTH(BURST_LEN_WIDTH),
.NUM_BURST_WIDTH(NUM_BURST_WIDTH),
.DDR_ADDR_WIDTH(DDR_ADDR_WIDTH),
.DDR_DW(DDR_DW),
.BRAM0_ADDR_WIDTH(BRAM0_ADDR_WIDTH),
.BRAM1_ADDR_WIDTH(BRAM1_ADDR_WIDTH)
)
inst_pp_buffer_wrapper 
(
//DDR to BRAM request
clk,
rst_n,
rd_start,
rd_burst_len,
rd_num_burst,
rd_start_addr,    
rd_ready,
rd_done,
rd_start_bram_addr,

//BRAM to OUT channel
bram0_r_en,
bram1_r_en,
bram0_rdata,
bram1_rdata,
bram0_r_addr,
bram1_r_addr,

//AXI_DDR Channel
c0_ddr4_s_axi_arid,
c0_ddr4_s_axi_araddr,
c0_ddr4_s_axi_arlen,
c0_ddr4_s_axi_arsize,
c0_ddr4_s_axi_arburst,
c0_ddr4_s_axi_arlock,
c0_ddr4_s_axi_arcache,
c0_ddr4_s_axi_arprot,
c0_ddr4_s_axi_arqos,
c0_ddr4_s_axi_arvalid,
c0_ddr4_s_axi_arready,
c0_ddr4_s_axi_rready,
c0_ddr4_s_axi_rlast,
c0_ddr4_s_axi_rvalid,
c0_ddr4_s_axi_rresp,
c0_ddr4_s_axi_rid,
c0_ddr4_s_axi_rdata


);

pp_buffer_ddr_wrapper_top inst_pp_buffer_ddr_wrapper_top
(
c0_ddr4_s_axi_awid,
c0_ddr4_s_axi_awaddr,
c0_ddr4_s_axi_awlen,
c0_ddr4_s_axi_awsize,
c0_ddr4_s_axi_awburst,
c0_ddr4_s_axi_awlock,
c0_ddr4_s_axi_awcache,
c0_ddr4_s_axi_awprot,
c0_ddr4_s_axi_awqos,
c0_ddr4_s_axi_awvalid,
c0_ddr4_s_axi_awready,
c0_ddr4_s_axi_wdata,
c0_ddr4_s_axi_wstrb,
c0_ddr4_s_axi_wlast,
c0_ddr4_s_axi_wvalid,
c0_ddr4_s_axi_wready,
c0_ddr4_s_axi_bready,
c0_ddr4_s_axi_bid,
c0_ddr4_s_axi_bresp,
c0_ddr4_s_axi_bvalid,
c0_ddr4_s_axi_arid,
c0_ddr4_s_axi_araddr,
c0_ddr4_s_axi_arlen,
c0_ddr4_s_axi_arsize,
c0_ddr4_s_axi_arburst,
c0_ddr4_s_axi_arlock,
c0_ddr4_s_axi_arcache,
c0_ddr4_s_axi_arprot,
c0_ddr4_s_axi_arqos,
c0_ddr4_s_axi_arvalid,
c0_ddr4_s_axi_arready,
c0_ddr4_s_axi_rready,
c0_ddr4_s_axi_rlast,
c0_ddr4_s_axi_rvalid,
c0_ddr4_s_axi_rresp,
c0_ddr4_s_axi_rid,
c0_ddr4_s_axi_rdata,
clk,
rst_n,
init_calib_complete
);
endmodule