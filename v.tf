variable "appserviceplanname" {
	description = "Name of the App Service Plan"
	default = "${var.appserviceplanname}"
}

variable "appserviceplanloc" {
	description = "Location for the App Service Plan"
	default = "${var.appserviceplanloc}"
}

variable "appserviceplankind" {
	description = "Kind of the App service plan. eg.: Linux\Windows"
	default = "${var.appserviceplankind}"
}

variable "appserviceplantier" {
	description = "Tier for Application Service Plan"
	default = "${var.appserviceplantier}"
}

variable "appserviceplansize" {
	description = "Size for App service Plan"
	default = "${var.appserviceplansize}"
}

resource "azurerm_resource_group" "rg" {
	name     = "myTFModuleGroup"
	location = var.location
  }

module "app_service_plan" {
	source = ./modules/services/app_service_plan
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