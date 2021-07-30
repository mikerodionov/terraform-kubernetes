# terraform-kubernetes

This repo contains Terraform templates for deploying Kubernetes cluster on Azure. Although terraform template files themselves contain description of infrastructure to be provisioned, below you can find a list of Azure resources provisioned by template:

* Resource group
* Network and subnet
* 4 NICs
* 4 Azure VMs for Kubernetes cluster (Master, Worker x2, NFS node)
* Security group

To be able to apply Terraform template make sure you have correct settings in credentials.tf file.

NFS node is also used as Ansible controller, which requires open port 22 on it. Ansible controller has to have configured access with publcic key for root user.


```
├── LICENSE
├── README.md
└── Terraform
    ├── correccion-vars.tf
    ├── main.tf
    ├── network.tf
    ├── security.tf
    ├── vars.tf
    └── vm.tf
```
