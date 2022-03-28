

variable "def-location" {
  type        = string
  description = "Location for the LB deployment"
}

variable "rg-name" {
  type        = string
  description = "Resource group name"
}

variable "public-ip-id" {
  type        = string
  description = "Id of the public IP"
}

variable "public-subnet-id" {
  type        = string
  description = "Id of the public subnet"
}

variable "frontend-port-start" {
  type        = string
  description = "The starting point of the port range for the NAT configuration"
}

variable "frontend-port-end" {
  type        = string
  description = "The ending point of the port range for the NAT configuration"
}

variable "backend-address-pool-ids" {
  type        = list(string)
  description = "A list of IDs of backend pools for the LB to use"
}