# Define resources location
variable "location" {
  description = "Location of the managed resources"
  type        = string
  default     = "francecentral"
}

# Name of the existing resource group to create resources within
variable "resource_group_name" {
  description = "Name of the existing resource group to create resources within"
  type        = string
  default     = "feraudt-student-works"
}

# Name of mysql server
variable "mysql_server_name" {
  description = "Name of mysql server"
  type        = string
  default     = "mysql-server-wp-feraudt"
}

# VM size target for mysql server
variable "mysql_vm_size" {
  description = "VM size target for mysql server"
  type        = string
  default     = "B_Gen5_2"
}

# Storage capacity for mysql server
variable "mysql_storage" {
  description = "Storage capacity for mysql server"
  type        = string
  default     = 5120
}

# Version for mysql server
variable "mysql_version" {
  description = "Version for mysql server"
  type        = string
  default     = "5.7"
}

# Name of mysql database
variable "mysql_db_name" {
  description = "Name of mysql database"
  type        = string
  default     = "mysql-db-wp-feraudt"
}

# Cluster name
variable "cluster_name" {
  description = "Cluster name"
  type        = string
  default     = "wordpress-polyconseil-feraudt"
}

# Cluster environment tag
variable "environment" {
  description = "Cluster environment tag"
  type        = string
  default     = "Staging"
}

# VM size target for K8s cluster
variable "vm_size" {
  description = "VM size target for K8s cluster"
  type        = string
  default     = "Standard_A4_v2"
}

# Number of nodes within the cluster
variable "agent_count" {
  description = "Number of nodes within the cluster"
  type        = number
  default     = 1
}

# The following variables declarations are placeholder references.
# Set the values for these variable in terraform.tfvars or with the -var option
variable "arm_client_id" {
  default   = ""
  sensitive = true
}

variable "arm_client_secret" {
  default   = ""
  sensitive = true
}
variable "mysql_admin_user" {
  default   = ""
  sensitive = true
}

variable "mysql_admin_password" {
  default   = ""
  sensitive = true
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}
