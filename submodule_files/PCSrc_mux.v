`timescale 1ns / 1ps

module PCSrc_mux(
input [31:0] in0,
input [31:0] in1,
input PCSrc,
output [31:0] out
);
    assign out = (PCSrc)? in1: in0;
endmodule
