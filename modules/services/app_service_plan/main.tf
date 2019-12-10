resource "azurerm_app_service_plan" "azrmappsrvcpln" {
	name = "${var.appserviceplanname}"
	location = "${var.appserviceplanloc}"
	resource_group_name = "${azurerm_resource_group.rgname.name}"
	kind = "${var.appserviceplankind}"
	reserved = "${var.appserviceplankind == "linux" ? true : false }"
	sku {
		tier = "${var.appserviceplantier}"
		size = "${var.appserviceplansize}"
	}
}