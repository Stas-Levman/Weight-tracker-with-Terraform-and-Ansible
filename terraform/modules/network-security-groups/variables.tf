

variable "public-nsg-name" {
  type = string
}

variable "private-nsg-name" {
  type = string
}

variable "location" {
  type        = string
  description = "The location of the resource."
}

variable "rg-name" {
  type        = string
  description = "The name of the resource group the resource will be deployed to."
}
