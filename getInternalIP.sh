#!/bin/bash
ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l root $1 ip a show dev eth0 | grep 'inet 10' | sed 's/\/.*//' | sed 's/.*inet //'
