variable "VM-username" {
  type        = string
  description = "Admin username for the virtual machine."
}

variable "location" {
  type        = string
  description = "The location of the resource."
}

variable "rg-name" {
  type        = string
  description = "The name of the resource group the resource will be deployed to."
}

variable "admin-password" {
  type = string
  description = "The password used for the virtual machines"
}

#variable "VM-custom-data" {
#  type        = string
#  description = "The custom data we are inserting in to the machine and running at provision stage, This data is responsible for configuring the virtual machine"
#}

variable "public-subnet-id" {
  type = string
  description = "Id of the public subnet"
}

variable "backend-address-pool-ids" {
  type = list(string)
  description = "A list of backend pool IDs, the VMSS is going in this list"
}


variable "nat-rule-ids" {
  type = list(string)
  description = "A list of nar rule IDs"
}

variable "vmss-maximum-instances" {
  type = number
  description = "The maximum amount of virtual machines to scale yo to"
}

