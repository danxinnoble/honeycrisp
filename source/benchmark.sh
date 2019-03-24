#!/bin/bash

PROG_NAME=$1
N_PLAYERS=4
N_SQUARES=0

echo 'Compiling' $PROG_NAME
reqs=$(./compile.py $PROG_NAME | grep \'triple)

echo $reqs

N_TRIPLES=$(echo $reqs | grep -o \'triple\'\)..\[0-9\]* | grep -o \[0-9\]*)
N_BITS=$(echo $reqs | grep -o \'bit\'\)..\[0-9\]* | grep -o \[0-9\]*)

echo ''
echo 'Measuring the runtime and communication cost of' $PROG_NAME

COMM_T0=$(cat /proc/net/dev | grep -o lo..\[0-9\]* | grep -o \[0-9\]*)

for i in {0..2}; do
  ./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} $i $PROG_NAME > /dev/null 2> /dev/null &
done

time (./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} 3 $PROG_NAME > /dev/null 2> /dev/null ) 

COMM_T1=$(cat /proc/net/dev | grep -o lo..\[0-9]\* | grep -o \[0-9\]*)
echo 'Communication Cost (bytes):' $(($COMM_T1 - $COMM_T0))
