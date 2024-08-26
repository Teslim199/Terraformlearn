terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "terratest" {
  name = "testterra"

  location = "Japan East"
}
resource "azurerm_virtual_network" "terravn" {
  name                = "vnterra"
  address_space  = ["10.0.0.0/16"]
  location            = azurerm_resource_group.terratest.location
  resource_group_name = azurerm_resource_group.terratest.name
}
resource "azurerm_subnet" "azurerm_subnetterra" {
  name                = "terrasub"
  address_prefixes = ["10.0.2.0/24"]
resource_group_name = azurerm_resource_group.terratest.name
 virtual_network_name = azurerm_virtual_network.terravn
  }
