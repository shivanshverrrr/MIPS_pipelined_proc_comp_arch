`timescale 1ns / 1ps

module ExtControl_mux(
input [31:0] in0,
input [31:0] in1,
input ExtControl,
output [31:0] out
);
    assign out = (ExtControl)? in1: in0;
endmodule
