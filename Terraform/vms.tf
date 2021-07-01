# Create Kubernetes master(s)
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVM" {
    name                = "${var.vm_names[count.index]}.${var.domain}"
    computer_name       = "${var.vm_names[count.index]}.${var.domain}"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = "${var.vm_sizes[count.index]}"
    admin_username      = "mikhail"
    network_interface_ids = [element(azurerm_network_interface.myNic[*].id, count.index)]
    disable_password_authentication = true
    count = length(var.vm_names)

    admin_ssh_key {
        username   = "${var.ssh_user}"
        public_key = file("${var.public_key_path}")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    plan {
        name      = "centos-8-stream-free"
        product   = "centos-8-stream-free"
        publisher = "cognosys"
    }

    source_image_reference {
        publisher = "cognosys"
        offer     = "centos-8-stream-free"
        sku       = "centos-8-stream-free"
        version   = "1.2019.0810"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = "${var.tags}"

}

# Create disk for NFS VM
resource "azurerm_managed_disk" "DataDisk" {
  name                 = "nfs-disk1"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

# Attach disk to NFS VM
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.DataDisk.id
  virtual_machine_id = element(azurerm_linux_virtual_machine.myVM.*.id, 3)
  lun                = "10"
  caching            = "ReadWrite"
}