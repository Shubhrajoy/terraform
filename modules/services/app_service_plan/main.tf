resource "azurerm_app_service_plan" "azrmappsrvcpln" {
	name = "${var.appserviceplanname}"
	location = "${var.appserviceplanloc}"
	resource_group_name = "${var.rgname}"
	kind = "${var.appserviceplankind}"
	reserved = "${var.appserviceplankind == "linux" ? false : true }"
	sku {
		tier = "${var.appserviceplantier}"
		size = "${var.appserviceplansize}"
	}
}