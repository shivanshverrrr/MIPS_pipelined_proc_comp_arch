`timescale 1ns / 1ps

module data_mem(
input clk,
input reset,
input [31:0] address,
input [31:0] write_data,
input MemWrite,
input MemRead,
output [31:0] read_data
);
    integer i;
    reg [7:0] Mem [31:0]; // 32 places of 8 bits each, can be addressed using 5 bits 
    wire [4:0] addr = address[4:0];
    
    // reads from memory (Big Endian format)
    // what's the use of MemRead?
    assign read_data = {Mem[addr], Mem[addr+1], Mem[addr+2], Mem[addr+3]};
    
    // writes to memory
    always@(posedge clk) begin 
        if(MemWrite)
            {Mem[addr], Mem[addr+1], Mem[addr+2], Mem[addr+3]} = write_data;
    end
    
    // reset 
    always@(negedge reset) begin
        for(i = 0; i < 32; i = i + 1) begin
            Mem[i] = i;
        end
    end
    
    
endmodule
