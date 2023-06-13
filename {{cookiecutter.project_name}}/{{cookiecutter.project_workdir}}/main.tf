terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
    backend "azurerm" {
      resource_group_name  = "{{cookiecutter.current_rg_name}}"
      storage_account_name = "{{cookiecutter.current_storage_account_name}}"
      container_name       = "{{cookiecutter.current_storage_container_name}}"
      key                  = "{{current_storage_container_key}}"
    }
}

provider "azurerm" {
  features {

  }
}


provider "null" {
  # Configuration options
}

#====================================

module "network" {
  source = "./modules/network"

  az_location =  var.az_location
  az_rg_name = var.az_rg_name
  az_storage_name = var.az_storage_name

}

#====================================

module "security" {
  source = "./modules/security"


  depends_on = [
    module.network
  ]
}

#====================================

module "bastion" {
  source = "./modules/bastion"

  depends_on = [
    module.network,
    module.security
  ]
}

#====================================

module "storage" {
  source = "./modules/storage"

  az_location =  var.az_location
  az_rg_name = var.az_rg_name
  az_storage_name = var.az_storage_name

  depends_on = [
    module.network,
    module.security
  ]
}

#====================================

# module "application" {
#   source = "./modules/application"



#   depends_on = [
#     module.network,
#     module.security,
#     module.application,
#     module.storage
#   ]
# }
