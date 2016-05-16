#!/bin/bash

IP_NODE=$(./createServer.sh)
echo $IP_NODE >> hosts.nodes.tmp
echo $IP_NODE name=n$1 >> hosts.pis.tmp
