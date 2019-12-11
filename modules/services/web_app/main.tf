resource "azurerm_app_service" "example" {
	name                = "${var.app_service_name}"
	location            = "${var.app_service_location}"
	resource_group_name = "${var.rg_name}"
	app_service_plan_id = "${var.app_srvc_plan_id}"
}