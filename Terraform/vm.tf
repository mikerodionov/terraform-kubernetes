# Create Kubernetes master(s)
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVM" {
    name                = "master-${(count.index + 1)}.mikerodionov.com"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.kubernetes_master_vm_size
    admin_username      = "mikhail"
    network_interface_ids = [element(azurerm_network_interface.myNic[*].id, count.index)]
    disable_password_authentication = true
    count = "1"

    admin_ssh_key {
        username   = "mikhail"
        public_key = file("~/.ssh/authorized_keys/id_rsa.pub")
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