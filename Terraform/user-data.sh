#!/bin/bash
#installing Docker
apt-get update
apt-get install -y docker.io
systemctl start docker
systemctl enable docker
usermod -aG docker ubuntu

#installing AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

#installing unzip
apt install unzip
#unzipping AWS CLI package
unzip awscliv2.zip
#installing AWS CLI
sudo ./aws/install
#verifying AWS CLI installation
aws --version

#installing kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
#verifying kubectl installation
kubectl version --client --output=yaml  

# installing Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
#verifying Minikube installation
minikube version