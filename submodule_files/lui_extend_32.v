`timescale 1ns / 1ps

module lui_extend_32(
input [15:0] in,
output [31:0] out
);
    assign out = {in[15:0], {16{1'b0}}};
endmodule