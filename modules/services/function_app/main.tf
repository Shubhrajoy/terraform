resource "azurerm_function_app" "azrmfncapp" {
  name                      = "${var.functionappname}"
  location                  = "${var.functionapplocation}"
  resource_group_name       = "${var.rgname}"
  app_service_plan_id       = "${var.appsrvcplanid}"
  storage_connection_string = "${var.strgconnstring}"
}