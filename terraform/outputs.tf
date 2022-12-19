output "mysql_server_id" {
  value = azurerm_mysql_server.mysql_server_wp.id
}

output "mysql_server_fqdn" {
  value = azurerm_mysql_server.mysql_server_wp.fqdn
}

output "mysql_server_name" {
  value = azurerm_mysql_server.mysql_server_wp.name
}

output "mysql_db_id" {
  value = azurerm_mysql_database.mysql_db_wp.id
}

output "mysql_db_name" {
  value = azurerm_mysql_database.mysql_db_wp.name
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  sensitive = true
}

output "cluster_password" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  sensitive = true
}

output "cluster_username" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  sensitive = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive = true
}