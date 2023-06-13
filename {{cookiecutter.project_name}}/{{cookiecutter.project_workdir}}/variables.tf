# variable "key_name" {
#   type    = string
#   default = "keyPair"
# }
variable "az_storage_name" {
  type = string
}

variable "az_rg_name" {
  type = string
}

variable "az_location" {
  type = string
}

# variable "workstation_ip" {
#   type    = string
#   default = "185.13.180.0/24"
# }

# variable "cidr" {
#   type        = string
#   description = "VPC cidr block. Example: 10.10.0.0/16"
#   default     = "10.0.0.0/16"
# }

# variable "instance_type" {
#   type = string
# }

# variable "db_instance_type" {
#   type = string
# }