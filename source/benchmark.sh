PROG_NAME=Programs/lwe_test
N_PLAYERS=4
N_TRIPLES=512
N_BITS=0
N_SQUARES=0

cat /proc/net/dev | grep lo

COMM_T0=$(cat /proc/net/dev | grep -o lo..\[0-9\]* | grep -o \[0-9\]*)

for i in {0..2}; do
  ./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} $i $PROG_NAME > /dev/null 2> /dev/null &
done

time (./Player.x -max ${N_TRIPLES},${N_BITS},${N_SQUARES} 3 $PROG_NAME > /dev/null 2> /dev/null )

cat /proc/net/dev | grep lo
COMM_T1=$(cat /proc/net/dev | grep -o lo..\[0-9]\* | grep -o \[0-9\]*)


echo 'Communication Cost (bytes):' $(($COMM_T1 - $COMM_T0))
