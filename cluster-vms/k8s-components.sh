#! /bin/bash

version=$(curl -L https://dl.k8s.io/release/stable.txt)
echo "Kubectl version to be installed $version"

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(dpkg --print-architecture)

sudo curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/$version/bin/$os/$arch/kubectl"

sudo chmod +x /usr/local/bin/kubectl

kubectl version --client

echo "kubectl version $version was installed sucessfully"

# for k8s nodes: kubeadm, kubelet, kubectl

sudo curl -L -o /usr/local/bin/kubeadm https://dl.k8s.io/release/$version/bin/linux/amd64/kubeadm
sudo curl -L -o /usr/local/bin/kubelet https://dl.k8s.io/release/$version/bin/linux/amd64/kubelet
sudo curl -L -o /usr/local/bin/kubectl https://dl.k8s.io/release/$version/bin/linux/amd64/kubectl

sudo chmod +x /usr/local/bin/kube*

# ssh into vms and copy kubelet.service file to /etc/systemd/system and move kubeadm file to /etc/systemd/system/kubelet.service.d
# Start and enable the kubelet service

# Download container runtime: containerd, crictl, cni plugin