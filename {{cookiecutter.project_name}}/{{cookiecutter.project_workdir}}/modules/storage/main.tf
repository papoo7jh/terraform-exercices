terraform {
  # required_version = "~>=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10.0"
    }
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = var.az_storage_name
  resource_group_name      = var.az_rg_name
  location                 = var.az_location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "{{cookiecutter.project_env}}"
  }
}
