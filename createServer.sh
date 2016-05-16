#!/bin/bash

ID=$(scw run -d --commercial-type=C1 docker)

HOSTNAME=$(scw exec -w $ID hostname | tr -cd "[:print:]")

IP=$(scw ps | grep $HOSTNAME | sed 's/.*\s\([0-9][0-9][0-9]\?\.[0-9][0-9][0-9]\?\.[0-9][0-9][0-9]\?\.[0-9][0-9][0-9]\?\)\s.*/\1/')

echo $IP

