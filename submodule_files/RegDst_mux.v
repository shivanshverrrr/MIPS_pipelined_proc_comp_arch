`timescale 1ns / 1ps

module RegDst_mux(
input [4:0] in0,
input [4:0] in1,
input RegDst,
output [4:0] out
);
    assign out = (RegDst)? in1: in0;
endmodule
