`timescale 1ns / 1ps

module MEM_WB(
input clk,
input reset,
input MemtoReg_d, RegWrite_d, // WB
input [31:0] read_data_d,ALU_result_d,
input [4:0] rd_d,
input [5:0] opcode_d,

output reg MemtoReg_q, RegWrite_q,  // WB
output reg [31:0] read_data_q,ALU_result_q,
output reg [4:0] rd_q,
output reg [5:0] opcode_q
);
    always @(posedge clk or negedge reset) begin
    if (!reset) begin
        MemtoReg_q    <= 0;
        RegWrite_q    <= 0;
        read_data_q   <= 32'b0;
        ALU_result_q  <= 32'b0;
        rd_q          <= 5'b0;
        opcode_q      <= 6'b0;
    end else begin
        MemtoReg_q    <= MemtoReg_d;
        RegWrite_q    <= RegWrite_d;
        read_data_q   <= read_data_d;
        ALU_result_q  <= ALU_result_d;
        rd_q          <= rd_d;
        opcode_q      <= opcode_d;
    end
end
endmodule
