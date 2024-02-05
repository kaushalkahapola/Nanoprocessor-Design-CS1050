# Nanoprocessor Design Project

This repository contains VHDL files for the Nanoprocessor Design, a 4-bit processor capable of basic arithmetic operations. The processor is designed to be implemented on a Xilinx Vivado platform.

**Warning:** Do not add a Vivado project folder to this repository. Only VHDL files are allowed.

## Technologies Used

- VHDL
- Xilinx Vivado

## Contents

### Assembly & Machine Code

1. **Assembly Code**
2. **Machine Code**

### VHDL Code

#### Adders
- Half Adder
- Full Adder
- 3-bit Ripple Carry Adder
- 4-bit Ripple Carry Adder
- 4-bit Adder Subtractor

#### Address Selector
- Program Counter
- PC Incrementer
- Program ROM

#### D Flip Flop

#### Register
- Register Bank

#### Arithmetic Unit

#### Decoders
- 2 to 4 Decoder
- 3 to 8 Decoder

#### Multiplexers
- 2 Way N Bit Multiplexer
- 8 to 1 Multiplexer
- 8 Way 4 Bit Multiplexer

#### Operand Selector
- Instruction Decoder
- Load Selector
- Seven Segment Display Lookup Table

#### Slow Clock
- Nanoprocessor

### Simulation Files

- Instruction Decoder Simulation
- 2 Way 4 Bit Multiplexer Simulation
- 8 Way 4 Bit Multiplexer Simulation
- Program Counter Simulation
- Adder Subtractor Simulation
- Register Bank Simulation
- Nanoprocessor Simulation

## Getting Started

To use the VHDL files in this repository, follow these steps:

1. Clone the repository to your local machine.
2. Open the Vivado software and create a new project.
3. Add the VHDL files from the cloned repository to your project.
4. Customize and configure the design as needed.
5. Compile and synthesize the design in Vivado.
6. Program the target FPGA or generate the required output files.

For detailed instructions on using Vivado and working with VHDL files, refer to the Vivado documentation.
