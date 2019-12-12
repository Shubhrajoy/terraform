provider "azurerm" {}

module "app_service_plan" {
	source = "./modules/services/app_service_plan/"
	app_service_plan_name = "${var.app_service_plan_name}"
	app_service_plan_loc = "${var.app_service_plan_loc}"
	rg_name = "${var.rg_name}"
	app_service_plan_kind = "${var.app_service_plan_kind}"
	app_service_plan_tier = "${var.app_service_plan_tier}"
	app_service_plan_size = "${var.app_service_plan_size}"
}

module "function_app" {
	source = "./modules/services/function_app/"
	function_app_name = "${var.function_app_name}"
	function_app_location = "${var.function_app_location}"
	rg_name = "${var.rg_name}"
	app_srvc_plan_id = module.app_service_plan.app_srvc_plan_id
	strg_conn_string = "${var.strg_conn_string}"
}

module "web_app" {
	source = "./modules/services/web_app/"
	app_service_name = "${var.app_service_name}"
	app_service_location = "${var.app_service_location}"
	rg_name = "${var.rg_name}"
	app_srvc_plan_id = module.app_service_plan.app_srvc_plan_id
}