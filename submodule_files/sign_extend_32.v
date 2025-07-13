`timescale 1ns / 1ps

module sign_extend_32(
input [15:0] in,
output [31:0] out
);
    assign out = {{16{in[15]}}, in[15:0]};
endmodule
