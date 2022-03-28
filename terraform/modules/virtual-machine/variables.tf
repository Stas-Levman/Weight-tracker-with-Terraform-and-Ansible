

variable "VM-amount" {
  type = string
  description = "Amount of instances created, also used to define instance and related resources names."
}

variable "VM-username" {
  type        = string
  description = "Admin username for the virtual machine."
}

variable "VM-name" {
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

variable "application-NIC-id" {
  type        = string
  description = "The ID of the network interface we will be using for the application VM"
}

variable "admin-password" {
  type = string
}

variable "VM-custom-data" {
  type        = string
  description = "Custom data to run on the VM at the provisioning state"
}


variable "public-subnet-id" {
  type = string
  description = "Id of the public subnet"
}




