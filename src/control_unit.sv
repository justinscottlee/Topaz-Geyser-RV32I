`timescale 1ns / 1ps

`include "defines.vh"

module control_unit(
    input integer instruction,
    output integer immediate,
    output logic [3:0] rd, rs1, rs2,
    output logic [3:0] alu_operation,
    output logic regfile_we, alu_a_sel, alu_b_sel
    );
    
    integer imm_I, imm_S, imm_B, imm_U, imm_J;
    assign imm_I = {{20{instruction[31]}}, instruction[31:20]};
    assign imm_S = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
    assign imm_B = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
    assign imm_U = {instruction[31:12], 12'b0};
    assign imm_J = {{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
    
    logic [6:0] opcode;
    logic [2:0] funct3;
    logic [6:0] funct7;
    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[31:25];

    assign rd = instruction[11:7];
    assign rs1 = instruction[19:15];
    assign rs2 = instruction[24:20];
    
    always_comb begin
    immediate = imm_I;
    alu_operation = `ALU_ADD;
    regfile_we = 1'b0;
    alu_a_sel = `ALU_A_SEL_RS1;
    alu_b_sel = `ALU_B_SEL_IMM;
    case (opcode)
    `OPCODE_LUI: begin
        
    end
    `OPCODE_AUIPC: begin
        
    end
    `OPCODE_JAL: begin
        
    end
    `OPCODE_JALR: begin
        
    end
    `OPCODE_BRANCH: begin
        case (funct3)
        `FUNCT3_BEQ: begin
            
        end
        `FUNCT3_BNE: begin
            
        end
        `FUNCT3_BLT: begin
            
        end
        `FUNCT3_BGE: begin
            
        end
        `FUNCT3_BLTU: begin
            
        end
        `FUNCT3_BGEU: begin
            
        end
        endcase
    end
    `OPCODE_LOAD: begin
        case (funct3)
        `FUNCT3_LB: begin
            
        end
        `FUNCT3_LH: begin
            
        end
        `FUNCT3_LW: begin
            
        end
        `FUNCT3_LBU: begin
            
        end
        `FUNCT3_LHU: begin
            
        end
        endcase
    end
    `OPCODE_STORE: begin
        case (funct3)
        `FUNCT3_SB: begin
            
        end
        `FUNCT3_SH: begin
            
        end
        `FUNCT3_SW: begin
            
        end
        endcase
    end
    `OPCODE_OP_IMM: begin
        immediate = imm_I;
        alu_operation = {funct7[5], funct3};
        alu_a_sel = `ALU_A_SEL_RS1;
        alu_b_sel = `ALU_B_SEL_IMM;
        regfile_we = 1'b1;
        case (funct3)
        `FUNCT3_ADDI: begin
            
        end
        `FUNCT3_SLTI: begin
            
        end
        `FUNCT3_SLTIU: begin
            
        end
        `FUNCT3_XORI: begin
            
        end
        `FUNCT3_ORI: begin
            
        end
        `FUNCT3_ANDI: begin
            
        end
        `FUNCT3_SLLI: begin
            
        end
        `FUNCT3_SRLI, `FUNCT3_SRAI: begin
            case (funct7)
            `FUNCT7_SRLI: begin
                
            end
            `FUNCT7_SRAI: begin
                
            end
            endcase
        end
        endcase
    end
    `OPCODE_OP: begin
        alu_operation = {funct7[5], funct3};
        alu_a_sel = `ALU_A_SEL_RS1;
        alu_b_sel = `ALU_B_SEL_RS2;
        regfile_we = 1'b1;
        case (funct3)
        `FUNCT3_ADD, `FUNCT3_SUB: begin
            case (funct7)
            `FUNCT7_ADD: begin
                
            end
            `FUNCT7_SUB: begin
                
            end
            endcase
        end
        `FUNCT3_SLL: begin
            
        end
        `FUNCT3_SLT: begin
            
        end
        `FUNCT3_SLTU: begin
            
        end
        `FUNCT3_XOR: begin
            
        end
        `FUNCT3_SRL, `FUNCT3_SRA: begin
            case (funct7)
            `FUNCT7_SRL: begin
                
            end
            `FUNCT7_SRA: begin
                
            end
            endcase
        end
        `FUNCT3_OR: begin
            
        end
        `FUNCT3_AND: begin
            
        end
        endcase
    end
    `OPCODE_FENCE: begin
        
        // unimplemented
    end
    `OPCODE_ECALL: begin
        
        // unimplemented
    end
    endcase
    end
endmodule