`timescale 1ns/1ps

module ddr_axi_write #(
    parameter DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 29,
    parameter BURST_LEN_WIDTH = 8
)
(
    input ACLK,
    input ARESETN,

    //UI WR FIFO
    input wr_start,
    input [BURST_LEN_WIDTH - 1 : 0] wr_burst_len,
    input [ADDR_WIDTH - 1 : 0] wr_start_addr,
    output wr_ready, //idle, wait to write
    input [DATA_WIDTH - 1 : 0] wr_fifo_rd_data,
    output wr_fifo_rd_valid,
    output wr_done, //one burst done
    
    //AXI4 WRITE ADDR CHANNEL
    output [3: 0] m_axi_awid,
    output [ADDR_WIDTH - 1 : 0] m_axi_awaddr,
    output [BURST_LEN_WIDTH - 1 : 0] m_axi_awlen,
    output [2 : 0] m_axi_awsize,
    output [1 : 0] m_axi_burst,
    output         m_axi_awlock,
    output [3 : 0] m_axi_awcache,
    output [2 : 0] m_axi_awprot,
    output [3 : 0] m_axi_awqos,
    output         m_axi_awvalid,
    input          m_axi_awready,

    //AXI4 WRITE DATA CHANNEL
    output [DATA_WIDTH - 1 : 0] m_axi_wdata,
    output [DATA_WIDTH / 8 - 1 : 0] m_axi_wstrb,
    output m_axi_wlast,
    output m_axi_wvalid,
    input m_axi_wready,

    //AXI WRITE RESP CHANNEL
    input [3 : 0] m_axi_bid,
    input [1 : 0] m_axi_bresp,
    input m_axi_bvalid,
    output m_axi_bready
);
localparam WR_IDLE = 3'b000;
localparam WA_START = 3'b001;
localparam WA_WAIT = 3'b011;
localparam WR_PROC = 3'b010;
localparam WR_WAIT = 3'b110;
localparam WR_DONE = 3'b111;
reg [2 : 0] wr_state;

reg [ADDR_WIDTH - 1 : 0] wr_start_addr_reg;
reg [BURST_LEN_WIDTH - 1 : 0] wr_burst_len_reg;
reg awvalid_reg;
reg wvalid_reg;
reg wlast_reg;

//constants for UI FIFO
assign wr_ready = (wr_state == WR_IDLE);
assign wr_fifo_rd_valid = (m_axi_wvalid & m_axi_wready);
assign wr_done = (wr_state == WR_DONE);
//constants for WRITE ADDR CHANNEL
assign m_axi_awid = 4'b1111;
assign m_axi_awaddr = wr_start_addr_reg;
assign m_axi_awlen = wr_burst_len_reg;
assign m_axi_awsize = 3'b011;
assign m_axi_awburst = 2'b01;
assign m_axi_awlock = 1'b0;
assign m_axi_awcache = 4'b0011;
assign m_axi_awprot = 3'b000;
assign m_axi_awqos = 4'b0000;
assign m_axi_awvalid = awvalid_reg;

//constants for WRITE DATA CHANNEL
assign m_axi_wdata = wr_fifo_rd_data;
assign m_axi_wstrb = 4'b1111;
assign m_axi_wlast = wlast_reg;
assign m_axi_wvalid = wvalid_reg;

//constants for WRITE RESP CHANNEL
assign m_axi_bready = m_axi_bvalid;

//state
always @(posedge ACLK or negedge ARESETN) begin
    if (!ARESETN) begin
        wr_state <= 0;
        wr_start_addr_reg <= 0;
        wr_burst_len_reg  <= 0;
        awvalid_reg <= 0;
        wvalid_reg <= 0;
        wlast_reg <= 0;
    end else begin
        case (wr_state)
            WR_IDLE: begin
                if (wr_start) begin
                    wr_state <= WA_START;
                    wr_start_addr_reg <= wr_start_addr;
                    wr_burst_len_reg <= wr_burst_len - 1;
                end
            end
            WA_START: begin
                wr_state <= WA_WAIT;
                awvalid_reg <= 1;
            end
            WA_WAIT: begin
                if (m_axi_awready) begin
                    awvalid_reg <= 0;
                    wr_state <= WR_PROC;
                    wvalid_reg <= 1;
                end
            end
            WR_PROC: begin
                
                if ((wr_burst_len_reg == 8'b0) & m_axi_wready) begin
                    wr_state <= WR_WAIT;
                    wvalid_reg <= 0;
                    wlast_reg <= 1;
                end else if (m_axi_wready) begin
                    wr_burst_len_reg <= wr_burst_len_reg - 'd1;
                end
            end
            WR_WAIT: begin
                wlast_reg <= 0;
                if (m_axi_bvalid & m_axi_bready) begin
                    wr_state <= WR_DONE;
                end
            end
            WR_DONE: begin
                wr_state <= WR_IDLE;
            end
            default: begin
                wr_state <= WR_IDLE;
            end
        endcase
    end
end

endmodule