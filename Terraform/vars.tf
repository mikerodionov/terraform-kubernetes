variable "location" {
  type = string
  description = "Azure Region for Infrastructure Deployment"
  default = "West Europe"
}
# Kubernetes minimum requirements
# Master 2 GB, 2 CPU (kubectl)
# Worker 1.5 GB, 2 CPU (pods)
variable "kubernetes_master_vm_size" {
  type = string
  description = "VM Size for Kubernetes master VM(s)"
  default = "Standard_A4_v2" # 8 GB, 4 CPU
}

variable "kubernetes_worker_vm_size" {
  type = string
  description = "VM Size for Kubernetes worker VM(s)"
  default = "Standard_A2_v2" # 4 GB, 2 CPU
}

variable "kubeworker_vm_name" {
    type = string
    description = "Kubernetes worker VM(s) base name"
    default = "worker"
}

variable "kubemaster_vm_name" {
    type = string
    description = "Kubernetes master VMs to create"
    default = "master"
}

variable "nfs_vm_name" {
    type = string
    description = "NFS VMs to create"
    default = "nfs"
}

variable "external_ip" {
    type = list(string)
    description = "Allowed external IP"
    default = ["85.56.51.6"]
}

variable "tags" {
    type = map
    default = {"environment":"Practice Case 2"}
    description = "Tags to assign to resources created by template"
}