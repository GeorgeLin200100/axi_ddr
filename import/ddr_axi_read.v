`timescale 1ns/1ps

module ddr_axi_read #(
    parameter DATA_WIDTH = 64,
    parameter ADDR_WIDTH = 29,
    parameter BURST_LEN_WIDTH = 8
)
(
    input ACLK,
    input ARESETN,

    //UI RD FIFO
    input rd_start,
    input [BURST_LEN_WIDTH - 1 : 0] rd_burst_len,
    input [ADDR_WIDTH - 1 : 0] rd_start_addr,
    output rd_ready, //idle, wait to read
    output [DATA_WIDTH - 1 : 0] rd_fifo_data,
    output rd_fifo_we,
    output rd_done, //one burst done
    
    //AXI4 MASTER
    output [3 : 0] m_axi_arid,
    output [ADDR_WIDTH - 1 : 0] m_axi_araddr,
    output [BURST_LEN_WIDTH - 1 : 0] m_axi_arlen,
    output [2 : 0] m_axi_arsize,
    output [1 : 0] m_axi_arburst,
    output [0 : 0] m_axi_arlock,
    output [3 : 0] m_axi_arcache,
    output [2 : 0] m_axi_arprot,
    output [3 : 0] m_axi_arqos,
    output m_axi_arvalid,
    input m_axi_arready,
    output m_axi_rready,
    input m_axi_rlast,
    input m_axi_rvalid,
    input [1 : 0] m_axi_rresp,
    input [3 : 0] m_axi_rid,
    input [DATA_WIDTH - 1 : 0] m_axi_rdata
);

    //state
    localparam S_RD_IDLE = 3'd0;
    localparam S_RA_START = 3'd1;
    localparam S_RD_WAIT = 3'd2;
    localparam S_RD_PROC = 3'd3;
    localparam S_RD_DONE = 3'd4;
    reg [2 : 0] rd_state;

    //in/out reg
    reg [ADDR_WIDTH - 1 : 0] m_axi_araddr_reg;
    reg [BURST_LEN_WIDTH - 1 : 0] m_axi_arlen_reg;
    reg m_axi_arvalid_reg;

    //constants
    assign m_axi_arid = 4'b1111;
    assign m_axi_arsize = 3'b011; //8 bytes
    assign m_axi_arburst = 2'b01; //incrementing burst
    assign m_axi_arlock = 1'b0; //no lock
    assign m_axi_arcache = 4'b0011; //	ARCACHE[0] 可缓冲;ARCACHE[1] 可缓存;ARCACHE[2] 读取分配;ARCACHE[3] 写入分配
    assign m_axi_arprot = 3'b000; //no protection
    assign m_axi_arqos = 4'b0000; //no QoS


    always @(posedge ACLK or negedge ARESETN) begin
        if (!ARESETN) begin
            rd_state <= S_RD_IDLE;
            m_axi_araddr_reg <= 0;
            m_axi_arlen_reg <= 0;
            m_axi_arvalid_reg <= 0;
        end else begin
            case (rd_state)
                S_RD_IDLE: begin
                    if (rd_start) begin
                        rd_state <= S_RA_START;
                        m_axi_araddr_reg <= rd_start_addr;
                        m_axi_arlen_reg <= rd_burst_len - 1;
                    end
                end
                S_RA_START: begin
                    rd_state <= S_RD_WAIT;
                    m_axi_arvalid_reg <= 1;
                end
                S_RD_WAIT: begin
                    if (m_axi_arready) begin
                        rd_state <= S_RD_PROC;
                        m_axi_arvalid_reg <= 0;
                    end
                end
                S_RD_PROC: begin
                    if (m_axi_rvalid & m_axi_rlast) begin
                        rd_state <= S_RD_DONE;
                    end
                end
                S_RD_DONE: begin
                    rd_state <= S_RD_IDLE;
                end
            endcase
        end
    end

    //data out
    assign rd_ready = (rd_state == S_RD_IDLE);
    assign m_axi_arvalid = m_axi_arvalid_reg;
    assign m_axi_araddr = m_axi_araddr_reg;
    assign m_axi_arlen = m_axi_arlen_reg;
    assign rd_done = (rd_state == S_RD_DONE);
    assign rd_fifo_we = m_axi_rvalid;
    assign rd_fifo_data = m_axi_rdata;

endmodule