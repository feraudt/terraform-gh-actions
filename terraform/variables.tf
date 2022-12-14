# Define resources location
variable "location" {
  description = "Location of the managed resources"
  type = string
  default = "francecentral"
}

# Name of the existing resource group to create resources within
variable "resource_group_name" {
  description = "Name of the existing resource group to create resources within"
  type = string
  default = "feraudt-student-works"
}

# Cluster name
variable "cluster_name" {
  description = "Cluster name"
  type = string
  default = "wordpress-polyconseil"
}

# Cluster environment tag
variable "environment" {
  description = "Cluster environment tag"
  type = string
  default = "Staging"
}

# VM size target for K8s cluster
variable "vm_size" {
  description = "VM size target for K8s cluster"
  type = string
  default = "Standard_K8S2_v1"
}

# Number of nodes within the cluster
variable "agent_count" {
  description = "Number of nodes within the cluster"
  type = number
  default = 1
}

# The following two variable declarations are placeholder references.
# Set the values for these variable in terraform.tfvars
variable "aks_service_principal_app_id" {
  default = ""
}

variable "aks_service_principal_client_secret" {
  default = ""
  sensitive = true
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}