`timescale 1ns/1ps

module async_fifo #(
    parameter DATA_WIDTH = 32,
    parameter FIFO_DEPTH = 128
)
(
    input rd_clk,
    input rd_rstn,
    input rd_en,
    output reg [DATA_WIDTH-1:0] rd_data,
    
    input wr_clk,
    input wr_rstn,
    input wr_en,
    input [DATA_WIDTH-1:0] wr_data,

    output full,
    output almost_full,
    output empty,
    output almost_empty
);

localparam ALMOST_FULL_MARGIN = 4;
localparam ALMOST_EMPTY_MARGIN = 4;
//fifo instantiation
reg [DATA_WIDTH-1:0] mem [0:FIFO_DEPTH-1];

//pointer
reg [FIFO_DEPTH : 0] rd_ptr;
reg [FIFO_DEPTH : 0] wr_ptr;
wire [FIFO_DEPTH : 0] rd_ptr_g; //grey code
wire [FIFO_DEPTH : 0] wr_ptr_g; //grey code

//CDC sync reg
reg [FIFO_DEPTH : 0] rd_ptr_g_2wr_reg1;
reg [FIFO_DEPTH : 0] rd_ptr_g_2wr_reg2;
reg [FIFO_DEPTH : 0] wr_ptr_g_2rd_reg1;
reg [FIFO_DEPTH : 0] wr_ptr_g_2rd_reg2;

//bin for almost full / empty
wire [FIFO_DEPTH : 0] rd_ptr_b_2wr_reg2;
wire [FIFO_DEPTH : 0] wr_ptr_b_2rd_reg2;

//gap for almost full / empty
wire [FIFO_DEPTH : 0] wgap;
wire [FIFO_DEPTH : 0] rgap;

//full/empty flag
assign full = (wr_ptr_g[FIFO_DEPTH] != rd_ptr_g_2wr_reg2[FIFO_DEPTH]) & (wr_ptr_g[FIFO_DEPTH - 1] != rd_ptr_g_2wr_reg2[FIFO_DEPTH - 1]) & (wr_ptr_g[FIFO_DEPTH-2:0] == rd_ptr_g_2wr_reg2[FIFO_DEPTH-2:0]);
assign empty = (rd_ptr_g == wr_ptr_g_2rd_reg2);

//grey code generation
assign rd_ptr_g = rd_ptr ^ (rd_ptr >> 1);
assign wr_ptr_g = wr_ptr ^ (wr_ptr >> 1);

//grey to bin decode
genvar i;
generate
    for (i = 0; i < FIFO_DEPTH; i = i + 1) begin
        assign rd_ptr_b_2wr_reg2[i] = ^ (rd_ptr_g_2wr_reg2 >> i);
        assign wr_ptr_b_2rd_reg2[i] = ^ (wr_ptr_g_2rd_reg2 >> i);
    end
endgenerate

assign rd_ptr_b_2wr_reg2[FIFO_DEPTH] = rd_ptr_g_2wr_reg2[FIFO_DEPTH];
assign wr_ptr_b_2rd_reg2[FIFO_DEPTH] = wr_ptr_g_2rd_reg2[FIFO_DEPTH];

//almost full/empty flag
assign wgap = (rd_ptr_b_2wr_reg2[FIFO_DEPTH] ^ wr_ptr[FIFO_DEPTH]) ? rd_ptr_b_2wr_reg2[FIFO_DEPTH - 1 : 0] - wr_ptr[FIFO_DEPTH - 1 : 0] : rd_ptr_b_2wr_reg2 + FIFO_DEPTH - wr_ptr;
assign almost_full = (wgap <= ALMOST_FULL_MARGIN);
assign rgap = wr_ptr_b_2rd_reg2 - rd_ptr;
assign almost_empty = (rgap <= ALMOST_EMPTY_MARGIN);



endmodule