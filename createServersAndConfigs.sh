#!/bin/bash

NUM_SLAVES=$1
if [ "x$1" == "x" ]; then
    NUM_SLAVES=1
fi

echo '[pis]' > hosts.pis.tmp
echo '[master]' > hosts.master.tmp
echo '[nodes]' > hosts.nodes.tmp

./createMaster.sh &

for (( i=1; i<=$NUM_SLAVES; i++ )); do
    ./createNode.sh $i &
done

wait

rm -f hosts
cat hosts.pis.tmp >> hosts
echo >> hosts
cat hosts.master.tmp >> hosts
echo >> hosts
cat hosts.nodes.tmp >> hosts

rm -f hosts.*.tmp
