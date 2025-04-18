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
// Create Date:   2025-04-18
// Design Name:   <ALU_Verification>
// Module Name:   <tb.sv>
// Project Name:  <ALU_Verification_UVM>

// Target Device: FPGA: AMD/Xilinx Virtex UltraScale VU9P
//                ASIC: TSMC 28nm HPC+
// Tool versions: Synopsys VCS, Cadence Xcelium, Mentor Questa
// Description:   This module implements an 8-bit Arithmetic Logic Unit (ALU)
//                capable of performing basic arithmetic and logical operations.
//                The ALU supports addition, subtraction, multiplication, and //division.
//                The output is registered on the positive edge of the clock, and a
//                carry-out flag is provided for addition operations. The ALU is //designed
//                for integration into larger digital systems, such as CPUs or DSPs.
//
// Dependencies:  None
//
//
//
//
/////////////////////////////////////////////////////////////// 


`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"


//--------------------------------------------------------
//Include Files
//--------------------------------------------------------
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"


module top;
  
  //--------------------------------------------------------
  //Instantiation
  //--------------------------------------------------------

  logic clock;
  
  alu_interface intf(.clock(clock));
  
  alu dut(
    .clock(intf.clock),
    .reset(intf.reset),
    .A(intf.a),
    .B(intf.b),
    .ALU_Sel(intf.op_code),
    .ALU_Out(intf.result),
    .CarryOut(intf.carry_out)
  );
  
  
  //--------------------------------------------------------
  //Interface Setting
  //--------------------------------------------------------
  initial begin
    uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", intf );
    //-- Refer: https://www.synopsys.com/content/dam/synopsys/services/whitepapers/hierarchical-testbench-configuration-using-uvm.pdf
  end
  
  
  
  //--------------------------------------------------------
  //Start The Test
  //--------------------------------------------------------
  initial begin
    run_test("alu_test");
  end
  
  
  //--------------------------------------------------------
  //Clock Generation
  //--------------------------------------------------------
  initial begin
    clock = 0;
    #5;
    forever begin
      clock = ~clock;
      #2;
    end
  end
  
  
  //--------------------------------------------------------
  //Maximum Simulation Time
  //--------------------------------------------------------
  initial begin
    #5000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
  
  
  //--------------------------------------------------------
  //Generate Waveforms
  //--------------------------------------------------------
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
  
endmodule: top
