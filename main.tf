resource "azurerm_resource_group" "rave1" {
  name     = "raverg"
  location = "West Europe"
}

resource "azurerm_storage_account" "ravest1" {
  name                     = "ravestg"
  resource_group_name      = azurerm_resource_group.rave1.name
  location                 = azurerm_resource_group.rave1.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "raverg"
    storage_account_name = "ravestg"  
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}