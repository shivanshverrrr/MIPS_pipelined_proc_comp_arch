`timescale 1ns / 1ps

module ALUSrc_mux(
input [31:0] in0,
input [31:0] in1,
input ALUSrc,
output [31:0] out
);
    assign out = (ALUSrc)? in1: in0;
endmodule