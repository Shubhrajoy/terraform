resource "azurerm_app_service_plan" "azrmappsrvcpln" {
	name = "${var.app_service_plan_name}"
	location = "${var.app_service_plan_loc}"
	resource_group_name = "${var.rg_name}"
	kind = "${var.app_service_plan_kind}"
	reserved = "${var.app_service_plan_kind == "linux" ? false : true }"
	sku {
		tier = "${var.app_service_plan_tier}"
		size = "${var.app_service_plan_size}"
	}
}