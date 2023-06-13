terraform {
  # required_version = "~>=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.10.0"
    }
  }
}

module "network" {
  source              = "Azure/network/azurerm"

  vnet_name = "{{cookiecutter.project_slug}}-vnet"

  resource_group_name = var.az_rg_name
  address_spaces      = var.az_adresses_spaces[*]
  subnet_prefixes     = var.az_net_prefixs[*]
  subnet_names        = var.az_subnets_names[*]

  use_for_each = true
  tags = {
    environment = "{{cookiecutter.project_env}}"
  }

  # depends_on = [module.security]
}