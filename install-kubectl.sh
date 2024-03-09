#! /bin/bash

version=$(curl -L https://dl.k8s.io/release/stable.txt)
echo "Kubectl version to be installed $version"

os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(dpkg --print-architecture)

sudo curl -L -o /usr/local/bin/kubectl "https://dl.k8s.io/release/$version/bin/$os/$arch/kubectl"

sudo chmod +x /usr/local/bin/kubectl

kubectl version --client

echo "kubectl version $version was installed sucessfully"
