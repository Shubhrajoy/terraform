provider "azurerm" {}

module "app_service_plan" {
	source = "./modules/services/app_service_plan/"
	appserviceplanname = "${var.appserviceplanname}"
	appserviceplanloc = "${var.appserviceplanloc}"
	rgname = "${var.rgname}"
	appserviceplankind = "${var.appserviceplankind}"
	appserviceplantier = "${var.appserviceplantier}"
	appserviceplansize = "${var.appserviceplansize}"
}

module "function_app" {
	source = "./modules/services/function_app/"
	functionappname = "${var.functionappname}"
	functionapplocation = "${var.functionapplocation}"
	rgname = "${var.rgname}"
	appsrvcplanid = module.app_service_plan.appsrvcplanid
	strgconnstring = "${var.strgconnstring}"
}