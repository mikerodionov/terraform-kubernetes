# terraform-kubernetes

This repo contains Terraform templates for deploying Kubernetes cluster on Azure. Although terraform template files themself contain description of infrastructure to be provisioned, below you can find a list of Azure resources provisioned by template:

* Resource group
* Network and subnet
* 3 NICs
* 3 Azure VMs for Kubernetes cluster
* Security group
* NFS

To be able to apply Terraform template make sure you have correct settings in credentials.tf file.


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
