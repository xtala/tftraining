variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}

resource "azurerm_service_plan" "free-plan" {
  name                = "plan-free-tier"
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "student-app" {
  name                = "webapp-training-${random_id.unique_suffix.hex}"
  resource_group_name = var.rg_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.free-plan.id
  site_config {
    always_on = false
  }
}

resource "random_id" "unique_suffix" {
  byte_length = 4
}

output "webapp_url" {
  value = "https://${azurerm_linux_web_app.student-app.default_hostname}"
}