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
// Module Name:   <env.sv>
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

class alu_env extends uvm_env;
  `uvm_component_utils(alu_env)
  
  alu_agent agnt;
  alu_scoreboard scb;
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "alu_env", uvm_component parent);
    super.new(name, parent);
    `uvm_info("ENV_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("ENV_CLASS", "Build Phase!", UVM_HIGH)
    
    agnt = alu_agent::type_id::create("agnt", this);
    scb = alu_scoreboard::type_id::create("scb", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("ENV_CLASS", "Connect Phase!", UVM_HIGH)
    
    agnt.mon.monitor_port.connect(scb.scoreboard_port);
    
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass: alu_env
