variable "app_service_plan_name" {
	description = "Name of the App Service Plan"
}

variable "app_service_plan_loc" {
	description = "Location for the App Service Plan"
}

variable "rg_name" {
    description = "The name of the resource group in which to create the App Service Plan and function app."
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

variable "function_app_name" {
    description = "Specifies the name of the Function App"
}

variable "function_app_location" {
    description = "Specifies the supported Azure location where the resource exists"
}

variable "strg_conn_string" {
    description = "The connection string of the backend storage account which will be used by this Function App"
}

variable "app_service_name" {
    description = "Specifies the name of the Web App"
}

variable "app_service_location" {
    description = "Specifies the supported Azure location where the resource will exist"
}