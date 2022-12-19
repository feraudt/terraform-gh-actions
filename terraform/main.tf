# Get existing Azure resource group
data "azurerm_resource_group" "host_rg" {
  name = var.resource_group_name
}

# Create MySQL server
resource "azurerm_mysql_server" "mysql_server_wp" {
  name                = var.mysql_server_name
  location            = data.azurerm_resource_group.host_rg.location
  resource_group_name = data.azurerm_resource_group.host_rg.name

  administrator_login          = var.mysql_admin_user
  administrator_login_password = var.mysql_admin_password

  sku_name   = var.mysql_vm_size
  storage_mb = var.mysql_storage
  version    = var.mysql_version

  backup_retention_days            = 7
  geo_redundant_backup_enabled     = false
  ssl_enforcement_enabled          = false
  ssl_minimal_tls_version_enforced = "TLSEnforcementDisabled"
}

resource "azurerm_mysql_firewall_rule" "mysql_allow_azure" {
  name                = "allowAzureIPs"
  resource_group_name = azurerm_mysql_server.mysql_server_wp.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server_wp.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

# Create MySQL database
resource "azurerm_mysql_database" "mysql_db_wp" {
  name                = var.mysql_db_name
  resource_group_name = azurerm_mysql_server.mysql_server_wp.resource_group_name
  server_name         = azurerm_mysql_server.mysql_server_wp.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}

# Create AKS cluster
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
    client_id     = var.arm_client_id
    client_secret = var.arm_client_secret
  }
}
