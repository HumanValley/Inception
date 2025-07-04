#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install -y curl

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d cluster create mycluster --port '8888:30080@server:0' #--port '31554:31554@server:0' - argocd, si vagrant (mais les ports sont en dynamqiue e base sur le service de argo)
