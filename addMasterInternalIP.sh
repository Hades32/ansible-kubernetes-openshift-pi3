#!/bin/bash
masterip=$(./getMasterInternalIP.sh)
./getServerIPs.sh | xargs -n1 -I{} ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -l root {} sh -c "'echo $masterip mast er >> /etc/hosts'"
