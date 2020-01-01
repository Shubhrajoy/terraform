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

resource "azurerm_app_service_plan" "azrmappsrvcpln" {
	name = "${var.app_service_plan_name}"
	location = coalesce(var.app_service_plan_loc,data.azurerm_resource_group.current.location)
	resource_group_name = "${var.rg_name}"
	kind = "${var.app_service_plan_kind}"
	reserved = "${var.app_service_plan_kind == "linux" ? false : true }"
	sku {
		tier = "${var.app_service_plan_tier}"
		size = "${var.app_service_plan_size}"
	}
	tags = merge(var.additional_tags,var.default_tags,data.azurerm_resource_group.current.tags)
}