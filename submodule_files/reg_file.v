`timescale 1ns / 1ps

module reg_file(
input [4:0] Read_Reg_Num_1,
input [4:0] Read_Reg_Num_2,
input [4:0] Write_Reg_Num,
input [31:0] Write_Data,
output [31:0] Read_Data_1,
output [31:0] Read_Data_2,
input RegWrite,
input reset, // active low reset
input clk
);
    reg [31:0] RegMemory [31:0];
    integer i;
    
    // register read
    assign Read_Data_1 = RegMemory[Read_Reg_Num_1];
    assign Read_Data_2 = RegMemory[Read_Reg_Num_2];
    
    // register write
    always@(posedge clk) begin
        if(RegWrite && Write_Reg_Num != 5'b0)
            RegMemory[Write_Reg_Num] = Write_Data;
    end
    
    // reset
    always@(negedge reset) begin
            for(i=0; i<32; i=i+1) 
                RegMemory[i] = 32'b0; // each regsiter has its index as its value
    end
    
endmodule
