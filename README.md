# Single Stage Pipeline Register

## Overview
This project implements a single-stage pipeline register using a valid-ready handshake protocol in SystemVerilog. The design safely transfers data between input and output while supporting backpressure.

## Features

 Valid-ready handshake based data transfer
 Backpressure handling
 Reset initializes pipeline to empty state
 Parameterized data width

## Verification
The design is verified using a SystemVerilog testbench. Simulation waveform confirms correct handshake behavior and data transfer.

## Waveform Result
Waveform screenshot is included in this repository to demonstrate correct operation.


## Files
- `pipeline_check.sv` → RTL design
- `testbench.sv` → Verification testbench
- Waveform screenshot → Simulation result

## Author
Utkarsh Jain
