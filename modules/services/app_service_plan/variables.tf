variable "app_service_plan_name" {
	type = "string"
	description = "Name of the App Service Plan"
}

variable "app_service_plan_loc" {
	type = "string"
	description = "Location for the App Service Plan"
}

variable "rg_name" {
	type = "string"
    description = "The name of the resource group in which to create the App Service Plan."
}

variable "app_service_plan_kind" {
	type = "string"
	description = "Kind of the App service plan. eg.: Linux or Windows"
}

variable "app_service_plan_tier" {
	type = "string"
	description = "Tier for Application Service Plan"
}

variable "app_service_plan_size" {
	type = "string"
	description = "Size for App service Plan"
}