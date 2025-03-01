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
// Create Date:   2025-02-28 
// Design Name:   <ALU_Verification>
// Module Name:   <sequence.sv>
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

class alu_base_sequence extends uvm_sequence;
  `uvm_object_utils(alu_base_sequence)
  
  alu_sequence_item reset_pkt;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name= "alu_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  
  //--------------------------------------------------------
  //Body Task
  //--------------------------------------------------------
  task body();
    `uvm_info("BASE_SEQ", "Inside body task!", UVM_HIGH)
    
    reset_pkt = alu_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() with {reset==1;};
    finish_item(reset_pkt);
        
  endtask: body
  
  
endclass: alu_base_sequence



class alu_test_sequence extends alu_base_sequence;
  `uvm_object_utils(alu_test_sequence)
  
  alu_sequence_item item;
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name= "alu_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ", "Inside Constructor!", UVM_HIGH)
  endfunction
  
  
  //--------------------------------------------------------
  //Body Task
  //--------------------------------------------------------
  task body();
    `uvm_info("TEST_SEQ", "Inside body task!", UVM_HIGH)
    
    item = alu_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize() with {reset==0;};
    finish_item(item);
        
  endtask: body
  
  
endclass: alu_test_sequence
