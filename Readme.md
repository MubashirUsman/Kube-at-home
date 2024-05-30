# K8s cluster setup using Kubeadm
Kubernetes components are installed using **ansible** to keep everything consistent.

Move the network files to /etc/systemd/network directory

# With Ansible
Ansible gets a dynamically generated inventory file from vagrant

## VMs using Vagrantfile
Here two ubuntu machines are managed using vagrant and the VirtualBox provisioner.
To provision VMs run
`vagrant up` in the directory where `vagrantfile` is placed.
