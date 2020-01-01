variable "access_group" {
  type = "string"
  default = ""
  description = "Group to be assigned the admin access to (if PG custom RBAC exists)"
}

variable "subscription_id" {
  type = "string"
  description = "ID of the subscription where the resource will be deployed"
}

variable "function_app_name" {
    type = "string"
    description = "Specifies the name of the Function App"
}

variable "function_app_location" {
    type = "string"
    description = "Specifies the supported Azure location where the resource exists"
}

variable "rg_name" {
    type = "string"
    description = "The name of the resource group in which to create the Function App."
}

variable "app_srvc_plan_id" {
    type = "string"
    description = " The ID of the App Service Plan within which to create this Function App."
}

variable "strg_conn_string" {
    type = "string"
    description = "The connection string of the backend storage account which will be used by this Function App"
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