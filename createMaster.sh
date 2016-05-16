#!/bin/bash

IP_MASTER=$(./createServer.sh)
echo $IP_MASTER >> hosts.master.tmp
echo $IP_MASTER 'name=k8s-master' 'host_extra="master registry"' >> hosts.pis.tmp

echo master_ip: `./getInternalIP.sh $IP_MASTER` >> internal_ips.yml
