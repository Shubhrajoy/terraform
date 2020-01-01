locals {
  subscription_id = "ed6d71e6-0262-49ad-b8ff-074000058889"
  tags = {
    Application_Name = "MyApp"
    Original_Requestor = "launchpad.im"
    Stage = "dev"
    Cost_Center = "1000501541"
    Application_Id = "CE73CF5D5A1652EA"
    Owning_Role = "CPA-ManageAccess"
  }
}

module "app_service_plan" {
	source = "./modules/services/app_service_plan/"
	access_group = "${var.access_group}"
	subscription_id = "${var.subscription_id}"
	app_service_plan_name = "${var.app_service_plan_name}"
	app_service_plan_loc = "${var.app_service_plan_loc}"
	rg_name = "${var.rg_name}"
	app_service_plan_kind = "${var.app_service_plan_kind}"
	app_service_plan_tier = "${var.app_service_plan_tier}"
	app_service_plan_size = "${var.app_service_plan_size}"
	default_tags = "${local.tags}"
	additional_tags = "${additional_tags}"
}

module "function_app" {
	source = "./modules/services/function_app/"
	access_group = "${var.access_group}"
	subscription_id = "${var.subscription_id}"
	function_app_name = "${var.function_app_name}"
	function_app_location = "${var.function_app_location}"
	rg_name = "${var.rg_name}"
	app_srvc_plan_id = module.app_service_plan.app_srvc_plan_id
	strg_conn_string = "${var.strg_conn_string}"
	default_tags = "${local.tags}"
	additional_tags = "${additional_tags}"
}

module "web_app" {
	source = "./modules/services/web_app/"
	access_group = "${var.access_group}"
	subscription_id = "${var.subscription_id}"
	app_service_name = "${var.app_service_name}"
	app_service_location = "${var.app_service_location}"
	rg_name = "${var.rg_name}"
	app_srvc_plan_id = module.app_service_plan.app_srvc_plan_id
	https_only = "${var.https_only}"
	runtime_version = "${var.runtime_version}"
	default_tags = "${local.tags}"
	additional_tags = "${additional_tags}"
}