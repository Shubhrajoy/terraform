variable "appserviceplanname" {
	description = "Name of the App Service Plan"
}

variable "appserviceplanloc" {
	description = "Location for the App Service Plan"
}

variable "rgname" {
    description = "The name of the resource group in which to create the App Service Plan and function app."
}

variable "appserviceplankind" {
	description = "Kind of the App service plan. eg.: Linux or Windows"
}

variable "appserviceplantier" {
	description = "Tier for Application Service Plan"
}

variable "appserviceplansize" {
	description = "Size for App service Plan"
}

variable "functionappname" {
    description = "Specifies the name of the Function App"
}

variable "functionapplocation" {
    description = "Specifies the supported Azure location where the resource exists"
}

variable "strgconnstring" {
    description = "The connection string of the backend storage account which will be used by this Function App"
}