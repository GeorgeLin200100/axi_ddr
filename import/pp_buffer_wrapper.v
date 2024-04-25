`timescale 1ns / 1ps

module pp_buffer_wrapper #(
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
//DDR to BRAM request
    input clk,
    input rst_n,
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
    input [BRAM1_ADDR_WIDTH - 1 : 0] bram1_r_addr,

//AXI_DDR Channel
    output [3: 0] m_axi_arid,
    output [DDR_ADDR_WIDTH - 1 : 0] m_axi_araddr,
    output [BURST_LEN_WIDTH - 1 : 0] m_axi_arlen,
    output [2 : 0] m_axi_arsize,
    output [1 : 0] m_axi_arburst,
    output         m_axi_arlock,
    output [3 : 0] m_axi_arcache,
    output [2 : 0] m_axi_arprot,
    output [3 : 0] m_axi_arqos,
    output         m_axi_arvalid,
    input          m_axi_arready,
    output m_axi_rready,
    input m_axi_rlast,
    input m_axi_rvalid,
    input [1 : 0] m_axi_rresp,
    input [3 : 0] m_axi_rid,
    input [DDR_DW - 1 : 0] m_axi_rdata


);

reg [1 : 0] d2b_active_bram; //01: BRAM0; 10: BRAM1
reg [BRAM0_ADDR_WIDTH - 1 : 0] d2b_bram_addr;

wire [BRAM0_ADDR_WIDTH - 1 : 0] bram0_w_addr;
wire [BRAM1_ADDR_WIDTH - 1 : 0] bram1_w_addr;
wire [BRAM0_DW - 1 : 0] bram0_wdata;
wire [BRAM1_DW - 1 : 0] bram1_wdata;

wire [BRAM0_DW - 1 : 0] rd_fifo_data;

//Select which bram to accept `rd_fifo_data` from DDR
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        d2b_active_bram <= 2'b01; // BRAM0 first
    end else if (rd_done) begin
        d2b_active_bram <= ~d2b_active_bram; //01 -> 10 -> 01 -> 10
    end
end

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        d2b_bram_addr <= 0;
    end else if (rd_start) begin
        d2b_bram_addr <= rd_start_bram_addr;
    end else if (rd_fifo_we) begin
        d2b_bram_addr <= d2b_bram_addr + 1;
    end
end

assign bram0_w_en = 1;
assign bram1_w_en = 1;
assign bram0_wdata = (d2b_active_bram[0])? rd_fifo_data : 0;
assign bram1_wdata = (d2b_active_bram[1])? rd_fifo_data : 0;
assign bram0_we = (d2b_active_bram[0])? rd_fifo_we : 0;
assign bram1_we = (d2b_active_bram[1])? rd_fifo_we : 0;
assign bram0_w_addr = (d2b_active_bram[0])? d2b_bram_addr : 0;
assign bram1_w_addr = (d2b_active_bram[1])? d2b_bram_addr : 0;

ddr_axi_read #(
    .DATA_WIDTH(DDR_DW),//parameter DATA_WIDTH = 64,
    .ADDR_WIDTH(DDR_ADDR_WIDTH),//parameter ADDR_WIDTH = 29,
    .BURST_LEN_WIDTH(BURST_LEN_WIDTH),//parameter BURST_LEN_WIDTH = 8,
    .NUM_BURST_WIDTH(NUM_BURST_WIDTH)//parameter NUM_BURST_WIDTH = 8
)
inst_ddr_axi_read
(
    .ACLK(clk),//input ACLK,
    .ARESETN(rst_n),//input ARESETN,

    //UI RD FIFO
    .rd_start(rd_start),//input rd_start,
    .rd_burst_len(rd_burst_len),//input [BURST_LEN_WIDTH - 1 : 0] rd_burst_len,// length for ONE burst
    .rd_start_addr(rd_start_addr),//input [ADDR_WIDTH - 1 : 0] rd_start_addr,
    .rd_num_burst(rd_num_burst),//input [NUM_BURST_WIDTH - 1 : 0] rd_num_burst, // how many bursts for the single read command
    .rd_ready(rd_ready),//output rd_ready, //idle, wait to read
    .rd_fifo_data(rd_fifo_data),//output [DATA_WIDTH - 1 : 0] rd_fifo_data,
    .rd_fifo_we(rd_fifo_we),//output rd_fifo_we,
    .rd_done(rd_done),//output rd_done, //one burst done
    
    //AXI4 MASTER
    .m_axi_arid(m_axi_arid),//output [3 : 0] m_axi_arid,
    .m_axi_araddr(m_axi_araddr),//output [ADDR_WIDTH - 1 : 0] m_axi_araddr,
    .m_axi_arlen(m_axi_arlen),//output [BURST_LEN_WIDTH - 1 : 0] m_axi_arlen,
    .m_axi_arsize(m_axi_arsize),//output [2 : 0] m_axi_arsize,
    .m_axi_arburst(m_axi_arburst),//output [1 : 0] m_axi_arburst,
    .m_axi_arlock(m_axi_arlock),//output [0 : 0] m_axi_arlock,
    .m_axi_arcache(m_axi_arcache),//output [3 : 0] m_axi_arcache,
    .m_axi_arprot(m_axi_arprot),//output [2 : 0] m_axi_arprot,
    .m_axi_arqos(m_axi_arqos),//output [3 : 0] m_axi_arqos,
    .m_axi_arvalid(m_axi_arvalid),//output m_axi_arvalid,
    .m_axi_arready(m_axi_arready),//input m_axi_arready,
    .m_axi_rready(m_axi_rready),//output m_axi_rready,
    .m_axi_rlast(m_axi_rlast),//input m_axi_rlast,
    .m_axi_rvalid(m_axi_rvalid),//input m_axi_rvalid,
    .m_axi_rresp(m_axi_rresp),//input [1 : 0] m_axi_rresp,
    .m_axi_rid(m_axi_rid),//input [3 : 0] m_axi_rid,
    .m_axi_rdata(m_axi_rdata)//input [DATA_WIDTH - 1 : 0] m_axi_rdata
);


Simple_Dual_BRAM #(
    .BRAM_DATA_WIDTH(BRAM0_DW),
    .BRAM_DEPTH(BRAM0_DEPTH),
    .BRAM_ADDR_WIDTH(BRAM0_ADDR_WIDTH)
)
inst0_Simple_Dual_BRAM
(
    .clk(clk),
    .we_a(bram0_we),
    .en_a(bram0_w_en),
    .addr_a(bram0_w_addr),
    .din_a(bram0_wdata),
    
    .en_b(bram0_r_en),
    .addr_b(bram0_r_addr),
    .dout_b(bram0_rdata)
);

Simple_Dual_BRAM #(
    .BRAM_DATA_WIDTH(BRAM1_DW),
    .BRAM_DEPTH(BRAM1_DEPTH),
    .BRAM_ADDR_WIDTH(BRAM1_ADDR_WIDTH)
)
inst1_Simple_Dual_BRAM
(
    .clk(clk),
    .we_a(bram1_we),
    .en_a(bram1_w_en),
    .addr_a(bram1_w_addr),
    .din_a(bram1_wdata),
    
    .en_b(bram1_r_en),
    .addr_b(bram1_r_addr),
    .dout_b(bram1_rdata)
);



endmodule