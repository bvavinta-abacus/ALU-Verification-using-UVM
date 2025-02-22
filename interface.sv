///////////////////////////////////////////////////////////////
//
// Company: Abacus Semiconductor Corporation
// Engineer:  Balaji Rao Vavintaparthi.
//
// Copyright (C) 2020-2025 Abacus Semiconductor Corporation
//
// This file and all derived works are confidential property of 
// Abacus Semiconductor Corporation
// 
// Create Date:   2025-02-15 
// Design Name:   <ALU_Verification>
// Module Name:   <interface.sv>
// Project Name:  <ALU_Verification_UVM>
// Target Device: For Example (FPGA: AMD/Xilinx Virtex UltraScale VU9
//   ASIC, target: TSMC 28HPC+,...)
// Tool versions: all
// Description:   Example Description
//                   for the Server-on-a-Chip and in identical form
//                   for the HRAM smart multi-homed memory
// Design Name:   ALU_Verification
// Module Name:   alu.sv
// Project Name:  ALU_Verification_UVM
// Target Device: FPGA: AMD/Xilinx Virtex UltraScale VU9P
//                ASIC: TSMC 28nm HPC+
// Tool versions: Synopsys VCS, Cadence Xcelium, Mentor Questa
// Description:   This module implements an 8-bit Arithmetic Logic Unit (ALU) 
//                capable of performing basic arithmetic and logical operations. 
//                The ALU supports addition, subtraction, multiplication, and division.
//                The output is registered on the positive edge of the clock, and a 
//                carry-out flag is provided for addition operations. The ALU is designed
//                for integration into larger digital systems, such as CPUs or DSPs.
//
// Dependencies:  None
//
// Revision:   0.01 - Design started
// Revision:   1.00 - Design verified and beginning of modification
//
//
//
///////////////////////////////////////////////////////////////
interface alu_interface(input logic clock);

  logic reset;

  logic [7:0] a, b;
  logic [3:0] op_code;
  logic [7:0] result;
  bit carry_out;

endinterface: alu_interface
