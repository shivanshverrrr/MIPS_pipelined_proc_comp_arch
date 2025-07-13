`timescale 1ns / 1ps

module PC_add_4(
input [31:0] PC,
output [31:0] out
);
    assign out = PC + 32'd4;
endmodule
