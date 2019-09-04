#!/bin/bash

iverilog encoder.v
vvp a.out +A=0 +B=0 +C=0 +D=0
vvp a.out +A=0 +B=0 +C=0 +D=1
vvp a.out +A=0 +B=0 +C=1 +D=0
vvp a.out +A=0 +B=0 +C=1 +D=1
vvp a.out +A=0 +B=1 +C=0 +D=0
vvp a.out +A=0 +B=1 +C=0 +D=1 
vvp a.out +A=0 +B=1 +C=1 +D=0
vvp a.out +A=0 +B=1 +C=1 +D=1
vvp a.out +A=1 +B=0 +C=0 +D=0
vvp a.out +A=1 +B=0 +C=0 +D=1
vvp a.out +A=1 +B=0 +C=1 +D=0
vvp a.out +A=1 +B=0 +C=1 +D=1
vvp a.out +A=1 +B=1 +C=0 +D=0
vvp a.out +A=1 +B=1 +C=0 +D=1 
vvp a.out +A=1 +B=1 +C=1 +D=0
vvp a.out +A=1 +B=1 +C=1 +D=1
rm a.out