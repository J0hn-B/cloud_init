variable "gcp_region" {
  default = "europe-west2"
}

# Cloud Nat vars
variable "compute_router_name" {
  default = "k3s-vm-nat-gateway"
}

variable "compute_router_nat_name" {
  default = "k3s-vm-nat-router"
}

# Compute vars
variable "compute_instance_name" {
  default = "k3s-development-01"
}

# Service Accounts vars
variable "service_account_id" {
  default = "k3s-multi-config-account"
}

variable "service_account_display_name" {
  default = "GitOps-Account"
}
