`timescale 1ns / 1ps

module MemtoReg_mux(
input [31:0] in0,
input [31:0] in1,
input MemtoReg,
output [31:0] out
);
    assign out = (MemtoReg)? in1: in0;
endmodule
