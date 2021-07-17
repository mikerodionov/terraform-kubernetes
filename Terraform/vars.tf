# Kubernetes minimum requirements
# Master 2 GB, 2 CPU (kubectl)
# Worker 1.5 GB, 2 CPU (pods)
# Standard_D1_v2 = 3,5 GB, 1 CPU
# Standard_D2_v2" = 7 GB, 2 CPU
# There is a limit of CPU per family which may not allow allocate desired sizes without request to increase the limit
# VM will be getting adapters with IPs 192.168.1.10 - 192.168.1.13
variable "vm_sizes" {
  type = list(string)
  description = "VM Sizes list"
  default = ["Standard_A2_v2", "Standard_D1_v2", "Standard_D1_v2", "Standard_D1_v2"]
}

variable "vm_names" {
    type = list(string)
    description = "VM Names List"
    default = ["master", "worker1", "worker2", "nfs"]
}

# Azure uses its own internal domain by default with DNS resolution working
variable "domain" {
    type = string
    description = "Domain suffix for machine names"
    default = "mikerodionov.com"
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