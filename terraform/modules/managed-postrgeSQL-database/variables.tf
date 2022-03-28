

variable "rg-name" {
  type        = string
  description = "The name of the resource group the resource will be deployed to."
}

variable "location" {
  type        = string
  description = "The location of the resource."

}

variable "private-subnet-id" {
  type        = string
  description = "Id of the private subnet"

}

variable "postgresql-db-password" {
  type        = string
  description = "The password that will be used for the application database"
}

variable "vnet-id" {
  type        = string
  description = "Id of the virtual network"
}