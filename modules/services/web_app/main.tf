locals {
  enable_custom_rbac = true # If this is disabled Role Assignments from ALL resources deployed using this module will be removed
  resource_custom_rbac = "PG KeyVault Contributor"
  enable_access_group = length(var.access_group) > 0 ? true : false
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
}

data "azurerm_resource_group" "current" {
  name = "${var.rg_name}"
}

resource "azurerm_app_service" "webapp" {
	name                = "${var.app_service_name}"
	location            = coalesce(var.app_service_location,data.azurerm_resource_group.current.location)
	resource_group_name = "${var.rg_name}"
	app_service_plan_id = "${var.app_srvc_plan_id}"
	https_only          = "${var.https_only}"
	runtime_version     = "${var.runtime_version}"

	tags = merge(var.additional_tags,var.default_tags,data.azurerm_resource_group.current.tags)
}