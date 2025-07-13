`timescale 1ns / 1ps

module inst_mem(
input  [31:0] PC,
input  reset,
output [31:0] inst_code
);
    reg [7:0] Mem [35:0]; // byte addressable memory of 36 locations
    
    assign inst_code = {Mem[PC],Mem[PC+1],Mem[PC+2],Mem[PC+3]}; // Big Endian specification
    
    always@(negedge reset) begin
            // initializing the memory
            {Mem[0],Mem[1],Mem[2],Mem[3]}     = 32'h8d61000c; // lw r1,r11,#12
            {Mem[4],Mem[5],Mem[6],Mem[7]}     = 32'h3d020008; // lui r2,r8,#8
            {Mem[8],Mem[9],Mem[10],Mem[11]}   = 32'h68281000; // mul r2, r1, r8
            {Mem[12],Mem[13],Mem[14],Mem[15]} = 32'h09800008; // jr r12
            {Mem[16],Mem[17],Mem[18],Mem[19]} = 32'h68c63000; // mul r6,r6,r6
            {Mem[20],Mem[21],Mem[22],Mem[23]} = 32'haca40004; // sw r4,4[r5]
            {Mem[24],Mem[25],Mem[26],Mem[27]} = 32'h3bdfff00; // or r31, r30, ff00
            {Mem[28],Mem[29],Mem[30],Mem[31]} = 32'h00000000;
            {Mem[32],Mem[33],Mem[34],Mem[35]} = 32'h00000000;   
    end
endmodule

//            {Mem[0],Mem[1],Mem[2],Mem[3]}     = 32'h8d61000c; // lw r1,r11,#12
//            {Mem[4],Mem[5],Mem[6],Mem[7]}     = 32'h3d020008; // lui r2,r8,#8
//            {Mem[8],Mem[9],Mem[10],Mem[11]}   = 32'h68281000; // mul r2, r1, r8
//            {Mem[12],Mem[13],Mem[14],Mem[15]} = 32'h09800008; // jr r12
//            {Mem[16],Mem[17],Mem[18],Mem[19]} = 32'h68c63000; // mul r6,r6,r6
//            {Mem[20],Mem[21],Mem[22],Mem[23]} = 32'haca40004; // sw r4,4[r5]
//            {Mem[24],Mem[25],Mem[26],Mem[27]} = 32'h3bdfff00; // or r31, r30, ff00
//            {Mem[28],Mem[29],Mem[30],Mem[31]} = 32'h00000000;
//            {Mem[32],Mem[33],Mem[34],Mem[35]} = 32'h00000000;   




//            // initializing the memory
//            {Mem[0],Mem[1],Mem[2],Mem[3]}     = 32'h8d61000c; // lw r1,r11,#12
//            {Mem[4],Mem[5],Mem[6],Mem[7]}     = 32'h3d020008; // lui r2,r8,#8
//            {Mem[8],Mem[9],Mem[10],Mem[11]}   = 32'h68281000; // mul r2, r1, r8
//            {Mem[12],Mem[13],Mem[14],Mem[15]} = 32'h0A800008; // jr r20
//            {Mem[16],Mem[17],Mem[18],Mem[19]} = 32'h68c63000; // mul r6,r6,r6
//            {Mem[20],Mem[21],Mem[22],Mem[23]} = 32'haca40004; // sw r4,4[r5]
//            {Mem[24],Mem[25],Mem[26],Mem[27]} = 32'h3bdfff00; // or r31, r30, ff00
//            {Mem[28],Mem[29],Mem[30],Mem[31]} = 32'h00000000;
//            {Mem[32],Mem[33],Mem[34],Mem[35]} = 32'h00000000;   