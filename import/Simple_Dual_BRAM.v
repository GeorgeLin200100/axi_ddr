`timescale 1ns / 1ps

module Simple_Dual_BRAM #(
    parameter BRAM_DATA_WIDTH = 96,
    parameter BRAM_DEPTH = 256,
    parameter BRAM_ADDR_WIDTH = $clog2(BRAM_DEPTH)
)
(
    input clk,
    input we_a,
    input en_a,
    input [BRAM_ADDR_WIDTH - 1 : 0] addr_a,
    input [BRAM_DATA_WIDTH - 1 : 0] din_a,
    
    input en_b,
    input [BRAM_ADDR_WIDTH - 1 : 0] addr_b,
    output [BRAM_DATA_WIDTH - 1 : 0] dout_b
);

reg [BRAM_DATA_WIDTH - 1 : 0] dout_b_r;
assign dout_b = dout_b_r;

(* RAM_STYLE = "BLOCK" *) reg [BRAM_DATA_WIDTH - 1 : 0] ram [BRAM_DEPTH - 1 : 0];

always @(posedge clk) begin
    if (en_a)
        if (we_a)
            ram[addr_a] <= din_a;
    if (en_b)
        dout_b_r <= ram[addr_b];
end


endmodule