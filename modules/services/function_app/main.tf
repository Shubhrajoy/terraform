resource "azurerm_function_app" "azrmfncapp" {
  name                      = "${var.function_app_name}"
  location                  = "${var.function_app_location}"
  resource_group_name       = "${var.rg_name}"
  app_service_plan_id       = "${var.app_srvc_plan_id}"
  storage_connection_string = "${var.strg_conn_string}"
}