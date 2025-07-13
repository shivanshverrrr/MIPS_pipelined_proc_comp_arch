`timescale 1ns / 1ps

module forwarding_unit(
input [5:0] EX_MEM_opcode,
input [5:0] MEM_WB_opcode,
input [4:0] EX_MEM_rd,
input [4:0] MEM_WB_rd,
input [4:0] ID_EX_rs,
input [4:0] ID_EX_rt,
output reg [1:0] forward_rs,
output reg [1:0] forward_rt 
);
    always@(*) begin
        // EX stage hazard
        if( (EX_MEM_opcode == 6'b001111 || EX_MEM_opcode == 6'b001110 || EX_MEM_opcode == 6'b011010 || EX_MEM_opcode == 6'b100011) && (EX_MEM_rd != 1'b0) && (EX_MEM_rd == ID_EX_rs)) begin
            if(EX_MEM_opcode == 6'b100011) 
                forward_rs = 2'b10;
            else
                forward_rs = 2'b01;
        end 
        // MEM stage hazard (executes are EX fails)
        else if((MEM_WB_opcode == 6'b001111 || MEM_WB_opcode == 6'b001110 || MEM_WB_opcode == 6'b011010 || MEM_WB_opcode == 6'b100011) && (MEM_WB_rd != 1'b0) && (MEM_WB_rd == ID_EX_rs) )
            forward_rs = 2'b11;
        // default forwarding
        else
            forward_rs = 2'b00;        
    end
    
    // rt forward
    always@(*) begin
        // EX stage hazard
        if( (EX_MEM_opcode == 6'b001111 || EX_MEM_opcode == 6'b001110 || EX_MEM_opcode == 6'b011010 || EX_MEM_opcode == 6'b100011) && (EX_MEM_rd != 1'b0) && (EX_MEM_rd == ID_EX_rt) ) begin
            if(EX_MEM_opcode == 6'b100011) 
                forward_rt = 2'b10;
            else
                forward_rt = 2'b01;
        end 
        // MEM stage hazard (executes are EX fails)
        else if( (MEM_WB_opcode == 6'b001111 || MEM_WB_opcode == 6'b001110 || MEM_WB_opcode == 6'b011010 || MEM_WB_opcode == 6'b100011) && (MEM_WB_rd != 1'b0) && (MEM_WB_rd == ID_EX_rt) )
            forward_rt = 2'b11;
        // default forwarding
        else
            forward_rt = 2'b00;
    end
    
endmodule
