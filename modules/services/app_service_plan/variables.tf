variable "app_service_plan_name" {
	description = "Name of the App Service Plan"
}

variable "app_service_plan_loc" {
	description = "Location for the App Service Plan"
}

variable "rg_name" {
    description = "The name of the resource group in which to create the App Service Plan."
}

variable "app_service_plan_kind" {
	description = "Kind of the App service plan. eg.: Linux or Windows"
}

variable "app_service_plan_tier" {
	description = "Tier for Application Service Plan"
}

variable "app_service_plan_size" {
	description = "Size for App service Plan"
}