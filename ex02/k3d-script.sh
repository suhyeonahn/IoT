#!/bin/bah

# Install vim, curl, ssh
sudo apt-get upgdate && sudo apt-get upgrade -y
sudo apt-get install -y vim curl openssh-server tree

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add current user to the docker group
sudo usermod -aG docker $USER

# Install K3D
curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Stop ufw
#sudo systemctl stop ufw

# Create a cluster
k3d cluster create mycluster

# Create namespaces
kubectl create namespace argocd
kubectl create namespace dev

# Deploy Argo CD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Deploy wil-playground app
kubectl apply -f wil-playground.yaml

# github ssh
ssh -T git@github.com

# Install Argo CD CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

# Get initial password for admin
sudo argocd admin initial-password -n argocd

# Login to Argo CD's IP
argocd login localhost:8080

# Change the password 'pass1234'
argocd account update-password

#Create app
kubectl config set-context --current --namespace=argocd
argocd app create -f app.yaml 

# Sync
argocd app sync playground

# Port forwarding
sudo kubectl port-forward --address 0.0.0.0 -n argocd svc/argocd-server 8080:443
sudo kubectl port-forward service/playground 8888:8888
