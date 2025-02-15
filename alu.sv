///////////////////////////////////////////////////////////////
//
// Company: Abacus Semiconductor Corporation
// Engineer:  <include your name here, list can grow>
//
// Copyright (C) 2020-2025 Abacus Semiconductor Corporation
//
// This file and all derived works are confidential property of 
// Abacus Semiconductor Corporation
// 
// Create Date:   2025-02-10 
// Design Name:   <ALU_Verification>
// Module Name:   <design.sv>
// Project Name:  <ALU_Verification_UVM>
// Target Device: For Example (FPGA: AMD/Xilinx Virtex UltraScale VU9
//   ASIC, target: TSMC 28HPC+,...)
// Tool versions: all
// Description:   Example Description
//                   for the Server-on-a-Chip and in identical form
//                   for the HRAM smart multi-homed memory
//
// Dependencies:  None
//
// Revision:   0.01 - Design started
// Revision:   1.00 - Design verified and beginning of modification
//
//
//
///////////////////////////////////////////////////////////////

module alu(
  input clock,
  input reset,
  input [7:0] A,B,  // ALU 8-bit Inputs                 
  input [3:0] ALU_Sel,// ALU Selection
  output reg [7:0] ALU_Out, // ALU 8-bit Output
  output bit CarryOut // Carry Out Flag
);

  reg [7:0] ALU_Result;
  wire [8:0] tmp;

  assign tmp = {1'b0,A} + {1'b0,B};

  
  always @(posedge clock or posedge reset) begin
    if(reset) begin
      ALU_Out  <= 8'd0;
      CarryOut <= 1'd0;
    end
    else begin
      ALU_Out <= ALU_Result;
      CarryOut <= tmp[8];
    end
  end


  always @(*) //introduce a bug here, A B sensitivity only, change ALU_Sel during
    begin
      case(ALU_Sel)
        4'b0000: // Addition
          ALU_Result = A + B ; 
        4'b0001: // Subtraction
          ALU_Result = A - B ;
        4'b0010: // Multiplication
          ALU_Result = A * B;
        4'b0011: // Division
          ALU_Result = A/B;
        default: ALU_Result = 8'hAC ; // Give out random BAD value
      endcase
    end

endmodule
