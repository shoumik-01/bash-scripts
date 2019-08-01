#!/usr/bin/env bash

ADDR=$(ip r l | grep src | awk '{for (i=1;i<=NF;i++) if ($i == "src") {print $(i+1)};}')
HOST=$(uname -n)
echo "$ADDR  $HOST $HOST.domain.com" >> /etc/hosts
