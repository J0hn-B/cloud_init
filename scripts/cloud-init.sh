#!/bin/sh

# Parameters
GET_USER=$(awk -F: '$3 == 1000 {print $1}' /etc/passwd) # Check for the first user

# Install k3s
curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE=644 sh -
cat /etc/rancher/k3s/k3s.yaml
mkdir -p /home/$GET_USER/.kube
cp /etc/rancher/k3s/k3s.yaml /home/$GET_USER/.kube/config
chown -R $GET_USER:users /home/$GET_USER/.kube
