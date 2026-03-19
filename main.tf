resource "azurerm_resource_group" "aks_rg" {
  name     = "h09-aks-rg"
  location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "h09-aks-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "h09aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  kubernetes_version = "1.34.3"
}