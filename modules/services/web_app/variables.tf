variable "access_group" {
  type = "string"
  default = ""
  description = "Group to be assigned the admin access to (if PG custom RBAC exists)"
}

variable "subscription_id" {
  type = "string"
  description = "ID of the subscription where the resource will be deployed"
}

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

variable "https_only" {
    type = "string"
    description = "Can the Function App only be accessed via HTTPS?"
}

variable "runtime_version" {
    type = "string"
    description = "The runtime version of the Authentication/Authorization module"
}

variable "default_tags" {
  type = map
  description = "Default tags for the resource"
}

variable "additional_tags" {
  type = map
  default = {}
  description = "Additional tags for the resource"
}