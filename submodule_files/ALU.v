`timescale 1ns / 1ps

module ALU(
input [31:0] in0,
input [31:0] in1,
input [1:0] control,
output reg [31:0] out,
output zero
);
    always@(*) begin
        case(control)
        2'b00: out = in0 + in1;
        2'b01: out = in0 | in1;
        2'b10: out = in0 * in1;
        2'b11: out = 0;
        endcase
    end
    
    assign zero = (out == 0)? 1'b1: 1'b0;
    
endmodule
