variable "app_service_name" {
    description = "Specifies the name of the Web App"
}

variable "app_service_location" {
    description = "Specifies the supported Azure location where the resource will exist"
}

variable "rg_name" {
    description = "The name of the resource group in which to create the Web App."
}

variable "app_srvc_plan_id" {
    description = " The ID of the App Service Plan within which to create this Function App."
}