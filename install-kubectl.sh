#! /bin/bash

version=$(curl -L https://dl.k8s.io/release/stable.txt)
echo "Kubectl version to be installed $version"

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(dpkg --print-architecture)

sudo curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/$version/bin/$os/$arch/kubectl"

sudo chmod +x /usr/local/bin/kubectl

kubectl version --client

echo "kubectl version $version was installed sucessfully"

# We need to install three things: kubeadm, kubelet, kubectl

sudo curl -L -o /usr/local/bin/kubeadm https://dl.k8s.io/release/$version/bin/linux/amd64/kubeadm
sudo curl -L -o /usr/local/bin/kubelet https://dl.k8s.io/release/$version/bin/linux/amd64/kubelet
sudo curl -L -o /usr/local/bin/kubectl https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl

sudo chmod +x /usr/local/bin/kube*
