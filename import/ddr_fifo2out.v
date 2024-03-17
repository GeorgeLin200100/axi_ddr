`timescale 1ns/1ps

module ddr_fifo2out #(
    parameter DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 29,
    parameter BURST_LEN_WIDTH = 8
)
(
    input clk,
    input rstn,
    
    //DDR RD FIFO
    output rd_fifo_rd_en,
    input [DATA_WIDTH-1:0] rd_fifo_rd_data,
    input rd_fifo_full,
    input rd_fifo_almost_full,
    input rd_fifo_empty,
    input rd_fifo_almost_empty,

    //DDR WR FIFO
    output wr_fifo_wr_en,
    output [DATA_WIDTH - 1 : 0] wr_fifo_wr_data,
    input wr_fifo_full,
    input wr_fifo_almost_full,
    input wr_fifo_empty,
    input wr_fifo_almost_empty,

    //DDR AXI READ MODULE
    output rd_start,
    output [BURST_LEN_WIDTH - 1 : 0] rd_burst_len,
    output [ADDR_WIDTH - 1 : 0] rd_start_addr,
    input rd_ready,
    input rd_done,

    //DDR AXI WRITE MODULE
    output wr_start,
    output [BURST_LEN_WIDTH - 1 : 0] wr_burst_len,
    output [ADDR_WIDTH - 1 : 0] wr_start_addr,
    input wr_ready,
    input wr_done,

    //UI
    input ui_start,
    input ui_rw, //0:read, 1:write
    input [ADDR_WIDTH - 1 : 0] ui_addr,
    input [DATA_WIDTH - 1 : 0] ui_data,
);

endmodule