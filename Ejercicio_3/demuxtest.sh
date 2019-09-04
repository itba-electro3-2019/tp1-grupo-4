#!/bin/bash

iverilog demux.v
vvp a.out +I=0 +S_1=0 +S_0=0
vvp a.out +I=0 +S_1=0 +S_0=1
vvp a.out +I=0 +S_1=1 +S_0=0
vvp a.out +I=0 +S_1=1 +S_0=1
vvp a.out +I=1 +S_1=0 +S_0=0
vvp a.out +I=1 +S_1=0 +S_0=1 
vvp a.out +I=1 +S_1=1 +S_0=0
vvp a.out +I=1 +S_1=1 +S_0=1
rm a.out