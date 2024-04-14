variable "prefix" {
  description = "Prefix"
  default = "annt40"
}

variable "resourceGroup" {
  description = "udacity-azd-prj1-vm"
  default     = "Azuredevops"
}

variable "location" {
  description = "Azure Region"
  default = "eastus" 
}

variable "username"{
  default = "AnNT40"
}

variable "password"{
  default= "azd$3223132231"
}

variable "packerImageId" {
  default = "/subscriptions/0ee6d06f-69ab-4b3b-9f35-003e1b6eb227/resourceGroups/Azuredevops/providers/Microsoft.Compute/images/myPackerImage"
  
}

variable "vmCount"{
  default = "2"
}