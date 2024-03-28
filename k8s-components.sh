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
# We need runc to configure containerd
# Cotainerd using cgroup2 does not work on ubuntu machines, so we need to use systemd cgroup driver
# sudo sed -i 's/SystemdCgroup = false/SystemdCgroup = true/g' /etc/containerd/config.toml
# Enable containerd service: sudo systemctl daemon-reload, systemctl enable --now containerd.service
# sudo kubeadm reset -f

# Networking features: install socat, conntrack
# Disable swap: sudo swapoff -a && sudo systemct mask swap.img.swap
# /etc/modules-load.d/k8s.conf /etc/sysctl/k8s.conf
# nano /etc/modules-load.d/k8s.conf
#   overlay
#   br_netfilter
# nano /etc/sysctl/k8s.conf
#   net.bridge.bridge-nf-call-iptables = 1
#   net.bridge.bridge-nf-call-ip6tables = 1
#   net.ipv4.ip_forward = 1
# Reboot machines

# kubeadm preflight checks to pull necessary images: kubeadm init phase preflight
# sudo kubeadm init --apiserver-advertise-address 192.168.0.227 --pod-network-cidr 100.64.0.0/16
# sudo kubectl --kubeconfig /etc/kubernetes/admin.conf get nodes

# Container networking is needed, I install Antrea cni
# sudo kubectl --kubeconfig /etc/kubernetes/admin.conf apply -f https://github.com/antrea-io/antrea/releases/download/v1.12.3/antrea.yml
