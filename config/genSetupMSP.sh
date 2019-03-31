#!/bin/bash

N_2=$1        # Committee size in second round
SHARING_FILE=$2
SUBSET=$3

echo 3
echo RootCA

echo $N_2
for (( i = 0; i < $N_2; i++ ))
do
  j=$( sed $((${i} + 1))'q;d' ${SUBSET} )   # sed is one-indexed
  echo 127.0.0.1
  echo Player${j}.crt
done

echo N
echo N
echo 4  # Custom MSP

p=$( head -n 1 ${SHARING_FILE})  # Prime size
echo $p


for (( i = 0; i < $N_2; i++ ))
do
  echo 1
done

# Get the number of columns (i.e. t+1). Is the same as in previous file.
head -n 4 ${SHARING_FILE} | tail -n 1 | grep --color=never -o \[0-9\]*$

for (( i = 0; i < ${N_2}; i++ ))
do
  j=$( sed $((${i} + 1))'q;d' ${SUBSET} )   # sed is one-indexed
  echo $( sed $((5 + ${j}))'q;d' ${SHARING_FILE} )
done


echo
