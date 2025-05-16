# ALU-Verification-using-UVM
Overview:
This project presents the design and verification of an 8-bit Arithmetic Logic Unit (ALU) using the Universal Verification Methodology (UVM) in SystemVerilog. The ALU supports a variety of arithmetic and logical operations, and the UVM-based testbench ensures thorough verification through constrained random testing and coverage analysis.

Features:
ALU Design: Implements operations such as addition, subtraction, bitwise AND, OR, XOR, NOT, shift left/right, and comparison operations.

UVM Testbench: A modular and reusable testbench structure including components like driver, monitor, scoreboard, sequencer, and sequences.

Constrained Random Testing: Generates diverse input scenarios to validate ALU functionality under various conditions.

Coverage Analysis: Monitors functional coverage to ensure all operation scenarios are exercised.

Incorporation of Material:
The testbench architecture and verification strategies are inspired by standard UVM practices and similar open-source projects. The modular design ensures scalability and reusability for verifying other digital designs.
