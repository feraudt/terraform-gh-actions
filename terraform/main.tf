# Azure resource group
data "azurerm_resource_group" "host_rg" {
  name = var.resource_group_name
}

resource "azurerm_kubernetes_cluster" "k8s" {
  location            = data.azurerm_resource_group.host_rg.location
  name                = var.cluster_name
  resource_group_name = data.azurerm_resource_group.host_rg.name
  dns_prefix          = var.cluster_name
  tags = {
    Environment = var.environment
  }

  default_node_pool {
    name       = "agentpool"
    vm_size    = var.vm_size
    node_count = var.agent_count
  }
  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }
  service_principal {
    client_id     = var.aks_sp_client_id
    client_secret = var.aks_sp_client_secret
  }
}
