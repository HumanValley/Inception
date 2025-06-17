#!/bin/bash

NODE_IP=$(ip -4 addr show eth1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

export INSTALL_K3S_EXEC="--node-ip=$NODE_IP"

curl -sfL https://get.k3s.io | sh -