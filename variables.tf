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
    description = "The name of the resource group in which to create the App Service Plan and function app."
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

variable "function_app_name" {
    type = "string"
    description = "Specifies the name of the Function App"
}

variable "function_app_location" {
    type = "string"
    description = "Specifies the supported Azure location where the resource exists"
}

variable "strg_conn_string" {
    type = "string"
    description = "The connection string of the backend storage account which will be used by this Function App"
}

variable "app_service_name" {
    type = "string"
    description = "Specifies the name of the Web App"
}

variable "app_service_location" {
    type = "string"
    description = "Specifies the supported Azure location where the resource will exist"
}