`timescale 1ns / 1ps

module IF_ID(
input clk,
input reset,
input flush,
input [31:0] inst_code_d,
output reg [31:0] inst_code_q
);
    always@(posedge clk or negedge reset) begin
    if(!reset) begin
        inst_code_q <= 32'd0;
    end
    else if(flush) begin
        inst_code_q <= 32'd0;
    end
    else begin
        inst_code_q <= inst_code_d;
    end
    end
endmodule
