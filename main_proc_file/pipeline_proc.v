`timescale 1ns / 1ps

module pipeline_proc(
input clk,
input reset
);
    
    wire [31:0] w0,w1,w2,w3,w4,w5,w8,w9,w10,w31,w32;
    wire [31:0] w37,w38,w39,w40,w41,w42,w44,w45,w46;
    wire [31:0] w53,w56,w57,w60,w61,w62;
    wire [15:0] w33;
    wire [5:0] w21,w47,w59;
    wire [4:0] w7,w34,w35,w36,w43,w48,w58;
    wire [1:0] w12,w23;
    wire [1:0] sel_rs,sel_rt;
    wire w6,w11,w13,w14,w15,w16,w17,w18,w19,w20;
    wire w22,w24,w25,w26,w27,w28,w29,w30,w49,w50;
    wire w51,w52,w54,w55;
    wire zero;
    
    IF_ID IF_ID(
        .clk(clk),
        .reset(reset),
        .flush(w6),
        .inst_code_d(w2),
        .inst_code_q(w5)
    );
    
           
    PC PC(
        .reset(reset), 
        .clk(clk),
        .d(w0),
        .q(w1)
    );
    
    inst_mem inst_mem(
        .PC(w1),
        .reset(reset),
        .inst_code(w2)
    );
    
    PC_add_4 PC_add_4(
        .PC(w1),
        .out(w3)
    );
    
    PCSrc_mux PCSrc_mux(
        .in0(w3),
        .in1(w4),
        .PCSrc(w6),
        .out(w0)
    );   
            
    reg_file reg_file(
        .Read_Reg_Num_1(w5[25:21]), 
        .Read_Reg_Num_2(w5[20:16]), 
        .Write_Reg_Num(w7), 
        .Write_Data(w8), 
        .Read_Data_1(w9), 
        .Read_Data_2(w10), 
        .RegWrite(w55), 
        .reset(reset), 
        .clk(clk)        
    ); 
    
    main_control main_control(
        .opcode(w5[31:26]), 
        .ALUControl(w12), 
        .ALUSrc(w13), 
        .RegDst(w14), 
        .ExtControl(w15), 
        .PCSrc(w16), 
        .MemWrite(w17), 
        .MemRead(w18), 
        .MemtoReg(w19), 
        .RegWrite(w20)
    );
    
    ID_EX ID_EX(
        .clk(clk), .reset(reset), .flush(w6),
        .ALUSrc_d(w13), .ALUControl_d(w12), .ExtControl_d(w15), .RegDst_d(w14), // EX
        .MemWrite_d(w17), .MemRead_d(w18), .PCSrc_d(w16),                       // MEM            
        .MemtoReg_d(w19), .RegWrite_d(w20),                                     // WB
        .opcode_d(w5[31:26]), 
        .rs_data_d(w9), .rt_data_d(w10), 
        .imm_d(w5[15:0]), 
        .rs_d(w5[25:21]), .rt_d(w5[20:16]), .rd_d(w5[15:11]), 
    
        .opcode_q(w21), 
        .ALUSrc_q(w22), .ALUControl_q(w23), .ExtControl_q(w24), .RegDst_q(w25), 
        .MemWrite_q(w26), .MemRead_q(w27), .PCSrc_q(w28), 
        .MemtoReg_q(w29), .RegWrite_q(w30), 
        .rs_data_q(w31), .rt_data_q(w32), 
        .imm_q(w33), 
        .rs_q(w34), .rt_q(w35), .rd_q(w36)
    );
    
    sign_extend_32 sign_extend_32(
        .in(w33),
        .out(w41)
    );
    
    lui_extend_32 lui_extend_32(
        .in(w33),
        .out(w42)
    );
    
    ExtControl_mux ExtControl_0_mux(
        .in0(w61), // was w31
        .in1(32'b0),
        .ExtControl(w24),
        .out(w37)
    );
    
    ExtControl_mux ExtControl_1_mux(
        .in0(w41),
        .in1(w42),
        .ExtControl(w24),
        .out(w38)
    );
    
    ALUSrc_mux ALUSrc_mux(
        .in0(w62),
        .in1(w38),
        .ALUSrc(w22),
        .out(w39)
    );
   
    RegDst_mux RegDst_mux(
        .in0(w35),
        .in1(w36),
        .RegDst(w25),
        .out(w43)
    );   
    
    ALU ALU(
        .in0(w37),
        .in1(w39),
        .control(w23),
        .out(w40),
        .zero(zero)
    );
    
    EX_MEM EX_MEM(
        .clk(clk), .reset(reset), .flush(w6), 
        .addr_d(w61), .result_d(w40), .rt_data_d(w62), 
        .opcode_d(w21), 
        .rd_d(w43), 
        .MemWrite_d(w26), .MemRead_d(w27), .PCSrc_d(w28), 
        .MemtoReg_d(w29), .RegWrite_d(w30), 
        
        .addr_q(w44), .result_q(w45), .rt_data_q(w46), 
        .opcode_q(w47), 
        .rd_q(w48), 
        .MemWrite_q(w49), .MemRead_q(w50), .PCSrc_q(w6), 
        .MemtoReg_q(w51), .RegWrite_q(w52)
    );
    
    data_mem data_mem( 
        .clk(clk),
        .reset(reset),
        .address(w45),
        .write_data(w46),
        .MemWrite(w49),
        .MemRead(w50),
        .read_data(w53)
    );
    
    MEM_WB MEM_WB(
        .clk(clk), .reset(reset),
        .MemtoReg_d(w51), .RegWrite_d(w52),
        .read_data_d(w53), .ALU_result_d(w45),
        .rd_d(w48),
        .opcode_d(w47),
        
        .MemtoReg_q(w54), .RegWrite_q(w55),
        .read_data_q(w56), .ALU_result_q(w57),
        .rd_q(w7),
        .opcode_q(w59)
    );
    
    MemtoReg_mux MemtoReg_mux(
        .in0(w57),
        .in1(w56),
        .MemtoReg(w54),
        .out(w8)
    );
    
    forwarding_unit forwarding_unit(
        .EX_MEM_opcode(w47),
        .MEM_WB_opcode(w59),
        .EX_MEM_rd(w48),
        .MEM_WB_rd(w7),
        .ID_EX_rs(w34),
        .ID_EX_rt(w35),
        .forward_rs(sel_rs),
        .forward_rt(sel_rt)
    );
    
    forward_mux rs_mux(
        .i0(w31),
        .i1(w45),
        .i2(w53),
        .i3(w8),
        .sel(sel_rs),
        .out(w61)
    );
    
    forward_mux rt_mux(
        .i0(w32),
        .i1(w45),
        .i2(w53),
        .i3(w8),
        .sel(sel_rt),
        .out(w62)
    );
    
    assign w4 = w44;
   
endmodule
