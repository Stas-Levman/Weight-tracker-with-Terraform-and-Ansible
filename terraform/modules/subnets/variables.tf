

variable "rg-name" {
  type        = string
  description = "Resource group name"

}

variable "vnet-name" {
  type        = string
  description = "Name of the virtual network"
}

variable "public-scg-id" {
  type        = string
  description = "Id of the public security group"
}

variable "private-scg-id" {
  type        = string
  description = "ID of the private security group"
}

