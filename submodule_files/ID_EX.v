`timescale 1ns / 1ps

module ID_EX(
input clk,
input reset,
input flush,

input ALUSrc_d, ExtControl_d, RegDst_d, // EX control signals
input [1:0] ALUControl_d,
input MemWrite_d, MemRead_d, PCSrc_d, // MEM control
input MemtoReg_d, RegWrite_d, // WB control
input [5:0] opcode_d,
input [31:0] rs_data_d, rt_data_d,
input [15:0] imm_d,
input [4:0] rs_d, rt_d, rd_d,

output reg [5:0] opcode_q,
output reg [1:0] ALUControl_q,
output reg ALUSrc_q, ExtControl_q, RegDst_q, // EX control signals
output reg MemWrite_q, MemRead_q, PCSrc_q,                // MEM control
output reg MemtoReg_q, RegWrite_q,                        // WB control
output reg [31:0] rs_data_q, rt_data_q,
output reg [15:0] imm_q,
output reg [4:0] rs_q, rt_q, rd_q
);

always@(negedge clk or negedge reset) begin
    if(!reset | flush) begin
        opcode_q     <= 6'b0;

        ALUSrc_q     <= 0;
        ALUControl_q <= 0;
        ExtControl_q <= 0;
        RegDst_q     <= 0;

        MemWrite_q   <= 0;
        MemRead_q    <= 0;
        PCSrc_q      <= 0;

        MemtoReg_q   <= 0;
        RegWrite_q   <= 0;

         rs_data_q    <= 32'b0;
         rt_data_q    <= 32'b0;
        imm_q        <= 16'b0;

        rs_q         <= 5'b0;
        rt_q         <= 5'b0;
        rd_q         <= 5'b0;
    end
    else begin
        opcode_q     <= opcode_d;

        ALUSrc_q     <= ALUSrc_d;
        ALUControl_q <= ALUControl_d;
        ExtControl_q <= ExtControl_d;
        RegDst_q     <= RegDst_d;

        MemWrite_q   <= MemWrite_d;
        MemRead_q    <= MemRead_d;
        PCSrc_q      <= PCSrc_d;

        MemtoReg_q   <= MemtoReg_d;
        RegWrite_q   <= RegWrite_d;

         rs_data_q    <= rs_data_d;
         rt_data_q    <= rt_data_d;
        imm_q        <= imm_d;

        rs_q         <= rs_d;
        rt_q         <= rt_d;
        rd_q         <= rd_d;
    end
    end
endmodule
