#!/bin/bash

NUM_SLAVES=$1
if [ "x$1" == "x" ]; then
    NUM_SLAVES=1
fi

echo '[pis]' > hosts.pis.tmp
echo '[master]' > hosts.master.tmp
echo '[nodes]' > hosts.nodes.tmp

IP_MASTER=$(./createServer.sh)
echo $IP_MASTER >> hosts.master.tmp
echo $IP_MASTER 'name=k8s-master' 'host_extra="master registry"' >> hosts.pis.tmp

echo master_ip: `./getInternalIP.sh $IP_MASTER` >> internal_ips.yml

for (( i=1; i<=$NUM_SLAVES; i++ )); do
    IP_NODE=$(./createServer.sh)
    echo $IP_NODE >> hosts.nodes.tmp
    echo $IP_NODE name=n$i >> hosts.pis.tmp
done

rm -f hosts
cat hosts.pis.tmp >> hosts
echo >> hosts
cat hosts.master.tmp >> hosts
echo >> hosts
cat hosts.nodes.tmp >> hosts

rm -f hosts.*.tmp
