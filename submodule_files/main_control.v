`timescale 1ns / 1ps

module main_control(
input [5:0] opcode,
output reg [1:0] ALUControl, //
output reg ALUSrc, //
output reg RegDst, //
output reg ExtControl, // 
output reg PCSrc, // 
output reg MemWrite, //
output reg MemRead, //
output reg MemtoReg, //
output reg RegWrite //
);
    always@(*) begin
        case(opcode)
        6'b100011: begin // lw
                       ALUControl <= 2'b00;
                       ALUSrc <= 1'b1;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b1;
                       RegWrite <= 1'b1; 
                   end 
        6'b101011: begin // sw
                       ALUControl <= 2'b00;
                       ALUSrc <= 1'b1;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b1;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b0;  
                   end
        6'b001111: begin // lui
                       ALUControl <= 2'b00;
                       ALUSrc <= 1'b1;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b1;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b1;   
                   end
        6'b001110: begin // ori
                       ALUControl <= 2'b01;
                       ALUSrc <= 1'b1;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b1;   
                   end
        6'b011010: begin // mul
                       ALUControl <= 2'b10;
                       ALUSrc <= 1'b0;
                       RegDst <= 1'b1;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b1;   
                   end
        6'b000010: begin // jr
                       ALUControl <= 2'b00;
                       ALUSrc <= 1'b0;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b1;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b1;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b0;   
                   end 
        default: begin 
                       ALUControl <= 2'b00;
                       ALUSrc <= 1'b0;
                       RegDst <= 1'b0;
                       ExtControl <= 1'b0;
                       PCSrc <= 1'b0;
                       MemWrite <= 1'b0;
                       MemRead <= 1'b0;
                       MemtoReg <= 1'b0;
                       RegWrite <= 1'b0; 
                   end                       
        endcase
    end
endmodule
