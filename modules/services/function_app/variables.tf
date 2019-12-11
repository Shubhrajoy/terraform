variable "functionappname" {
    description = "Specifies the name of the Function App"
}

variable "functionapplocation" {
    description = "Specifies the supported Azure location where the resource exists"
}

variable "rgname" {
    description = "The name of the resource group in which to create the Function App."
}

variable "appsrvcplanid" {
    description = " The ID of the App Service Plan within which to create this Function App."
}

variable "strgconnstring" {
    description = "The connection string of the backend storage account which will be used by this Function App"
}