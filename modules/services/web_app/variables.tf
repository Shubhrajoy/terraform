variable "app_service_name" {
    type = "string"
    description = "Specifies the name of the Web App"
}

variable "app_service_location" {
    type = "string"
    description = "Specifies the supported Azure location where the resource will exist"
}

variable "rg_name" {
    type = "string"
    description = "The name of the resource group in which to create the Web App."
}

variable "app_srvc_plan_id" {
    type = "string"
    description = " The ID of the App Service Plan within which to create this Function App."
}