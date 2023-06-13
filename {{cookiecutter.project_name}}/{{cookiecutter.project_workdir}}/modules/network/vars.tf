variable "az_storage_name" {
  type = string
}

variable "az_rg_name" {
  type = string
}

variable "az_location" {
  type = string
}

variable "az_adresses_spaces" {
  type = list(string)
  default = ["10.0.0.0/16"] # with 2 adresses_spaces => ["10.0.0.0/16", "10.2.0.0/16"]
}

variable "az_net_prefixs" {
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]
}

variable "az_subnets_names" {
  type = list(string)
  default = ["subnet1", "subnet2", "subnet3"]
}

# variable "az_subnets_map" {
#   type = map(string)
#   default = {
#     "subnet1" = "10.0.1.0/24",
#     "subnet2" = "10.0.2.0/24",
#     "subnet3" = "10.0.3.0/24"
#   }
# }