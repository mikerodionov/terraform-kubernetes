variable "location" {
  type = string
  description = "Azure Region for Infrastructure Deployment"
  default = "West Europe"
}

variable "storage_account" {
  type = string
  description = "Nombre para la storage account"
  default = "kubestoracc"
}


variable "public_key_path" {
  type = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default = "~/.ssh/authorized_keys/id_rsa.pub" # o la ruta correspondiente
}

variable "ssh_user" {
  type = string
  description = "Usuario para hacer ssh"
  default = "mikhail"
}

variable "external_ip" {
    type = list(string)
    description = "Allowed external IP"
    default = ["85.56.51.6"]
}