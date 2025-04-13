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
// Create Date:   2025-04-10
// Design Name:   <ALU_Verification>
// Module Name:   <scoreboard.sv>
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
///
//
//
//////////////////////////////////////////////////////////////


class alu_scoreboard extends uvm_test;
  `uvm_component_utils(alu_scoreboard)
  
  uvm_analysis_imp #(alu_sequence_item, alu_scoreboard) scoreboard_port;
  
  alu_sequence_item transactions[$];
  
  
  //--------------------------------------------------------
  //Constructor
  //--------------------------------------------------------
  function new(string name = "alu_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  
  //--------------------------------------------------------
  //Build Phase
  //--------------------------------------------------------
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  
  //--------------------------------------------------------
  //Connect Phase
  //--------------------------------------------------------
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
    
   
  endfunction: connect_phase
  
  
  //--------------------------------------------------------
  //Write Method
  //--------------------------------------------------------
  function void write(alu_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  
  
  //--------------------------------------------------------
  //Run Phase
  //--------------------------------------------------------
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      /*
      // get the packet
      // generate expected value
      // compare it with actual value
      // score the transactions accordingly
      */
      alu_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
      
    end
    
  endtask: run_phase
  
  
  //--------------------------------------------------------
  //Compare : Generate Expected Result and Compare with Actual
  //--------------------------------------------------------
  task compare(alu_sequence_item curr_trans);
    logic [7:0] expected;
    logic [7:0] actual;
    
    case(curr_trans.op_code)
      0: begin //A + B
        expected = curr_trans.a + curr_trans.b;
      end
      1: begin //A - B
        expected = curr_trans.a - curr_trans.b;
      end
      2: begin //A * B
        expected = curr_trans.a * curr_trans.b;
      end
      3: begin //A / B
        expected = curr_trans.a / curr_trans.b;
      end
    endcase
    
    actual = curr_trans.result;
    
    if(actual != expected) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", actual, expected))
    end
    else begin
      // Note: Can display the input and op_code as well if you want to see what's happening
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", actual, expected), UVM_LOW)
    end
    
  endtask: compare
  
  
endclass: alu_scoreboard 
