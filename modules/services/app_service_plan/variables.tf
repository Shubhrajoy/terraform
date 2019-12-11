variable "appserviceplanname" {
	description = "Name of the App Service Plan"
}

variable "appserviceplanloc" {
	description = "Location for the App Service Plan"
}

variable "rgname" {
    description = "The name of the resource group in which to create the App Service Plan."
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