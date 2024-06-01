# Kubeadm K8s cluster setup using Ansible
Kubernetes components are installed using **ansible** to keep everything consistent.


## VMs using Vagrantfile
Here two ubuntu machines are managed using vagrant and the VirtualBox provisioner.
To provision VMs run
`vagrant up` in the directory where `vagrantfile` is placed.
This will also run the ansible playbook against that group.

## With Ansible
Ansible gets a dynamically generated inventory file from vagrant.
I edited this file to add the two groups, i.e controlplane and worker, manually.
