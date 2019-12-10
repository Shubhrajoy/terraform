variable "appserviceplanname" {
	description = "Name of the App Service Plan"
	default = "${var.appserviceplanname}"
}

variable "appserviceplanloc" {
	description = "Location for the App Service Plan"
	default = "${var.appserviceplanloc}"
}

variable "appserviceplankind" {
	description = "Kind of the App service plan. eg.: Linux\Windows"
	default = "${var.appserviceplankind}"
}

variable "appserviceplantier" {
	description = "Tier for Application Service Plan"
	default = "${var.appserviceplantier}"
}

variable "appserviceplansize" {
	description = "Size for App service Plan"
	default = "${var.appserviceplansize}"
}