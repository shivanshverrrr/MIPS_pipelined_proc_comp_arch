`timescale 1ns / 1ps

module EX_MEM(
input clk,
input reset,
input flush,
input [31:0] addr_d, result_d, rt_data_d,
input [5:0] opcode_d,
input [4:0] rd_d,
input MemWrite_d, MemRead_d, PCSrc_d, // MEM
input MemtoReg_d, RegWrite_d, // WB

output reg [31:0] addr_q, result_q, rt_data_q,
output reg [5:0] opcode_q,
output reg [4:0] rd_q,
output reg MemWrite_q, MemRead_q, PCSrc_q,  // MEM
output reg MemtoReg_q, RegWrite_q           // WB
);
    always@(posedge clk or negedge reset) begin
        if (!reset | flush) begin
            addr_q      <= 32'b0;
            result_q    <= 32'b0;
            rt_data_q   <= 32'b0;
            
            opcode_q    <= 6'b0;
            
            rd_q        <= 5'b0;
    
            MemWrite_q  <= 0;
            MemRead_q   <= 0;
            PCSrc_q     <= 0;
            
            MemtoReg_q  <= 0;
            RegWrite_q  <= 0;
        end
        else begin
            addr_q      <= addr_d;
            result_q    <= result_d;
            rt_data_q   <= rt_data_d;
            
            opcode_q    <= opcode_d;
            
            rd_q        <= rd_d;
    
            MemWrite_q  <= MemWrite_d;
            MemRead_q   <= MemRead_d;
            PCSrc_q     <= PCSrc_d;
            
            MemtoReg_q  <= MemtoReg_d;
            RegWrite_q  <= RegWrite_d;
        end
    end
endmodule
