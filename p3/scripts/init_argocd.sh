#!/bin/bash

mkdir -p /vagrant/repo
git clone https://github.com/HumanValley/sajansse_inceptionp3_app.git /vagrant/repo/argocd-app

# Ajouter l'image de will pour l'utiliser dans l'app de argocd dans le repo
#docker pull wil42/playground:v1
#docker pull wil42/playground:v2

until kubectl get nodes &>/dev/null; do
  sleep 2
done

kubectl create namespace argocd
kubectl create namespace dev

# Ajouter argocd dans k3d
kubectl apply -n argocd -f /vagrant/utils/argocd.yaml

kubectl wait --namespace argocd \
  --for=condition=Ready pods --all \
  --timeout=180s

# Ajouter l'application du container dans argocd (app qui est dans le repo)
kubectl apply -f /vagrant/repo/argocd-app/argocd-app.yaml

#kubectl -n argocd patch svc argocd-server -p '{"spec": {"type": "NodePort"}}' # exposer argocd-server pour y acceder depuis la machine k3d
