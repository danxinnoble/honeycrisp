#!/bin/bash

PROG_NAME=$1
N_PLAYERS=4
N_TRIPLES=$2
N_BITS=$3
N_SQUARES=0

echo 'Measuring the runtime and communication cost of' $PROG_NAME

COMM_T0=$(cat /proc/net/dev | grep -o lo..\[0-9\]* | grep -o \[0-9\]*)

for i in {0..2}; do
  ./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} $i $PROG_NAME > /dev/null 2> /dev/null &
done

time (./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} 3 $PROG_NAME > /dev/null 2> /dev/null ) 

COMM_T1=$(cat /proc/net/dev | grep -o lo..\[0-9]\* | grep -o \[0-9\]*)
echo 'Communication Cost (bytes):' $(($COMM_T1 - $COMM_T0))
