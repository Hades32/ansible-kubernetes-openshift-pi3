#!/bin/bash

NUM_SLAVES=$1
if [ "x$1" == "x" ]; then
    NUM_SLAVES=1
fi

echo creating kubernetes cluster with $NUM_SLAVES nodes

./createServersAndConfigs.sh

ansible-playbook --ssh-extra-args='-o StrictHostKeyChecking=no' -i hosts kubernetes.yml

