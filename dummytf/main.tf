resource "null_resource" "example" {
  triggers = {
    // This will trigger the resource to be recreated on every apply
    timestamp = timestamp()
  }

  provisioner "local-exec" {
    command = "echo 'Hello, World!'"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacc"
  resource_group_name      = "example-resources"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = false  # Security issue: should be true
}