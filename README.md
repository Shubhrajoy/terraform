# Terraform Modules

This repo contains the guidelines for building modules @ P&G.

https://www.terraform.io/docs/modules/index.html

# Terraform Modules
A module is a container for multiple resources that are used together. Modules can be used to create lightweight abstractions, so that you can describe your infrastructure in terms of its architecture, rather than directly in terms of physical objects.

## Module Storage
All modules should be in its own GitHub repository 

## Module Naming Convention
All modules must use the following naming convention: terraform-(azure|aws|gcp)-(template?)-(service|functionality), for example terraform-azure-logic-apps or terraform-azure-template-web-app

## Module Structure
Most commonly, modules use:
* Input variables to accept values from the calling module.
* Output values to return results to the calling module, which it can then use to populate arguments elsewhere.
* Resources to define one or more infrastructure objects that the module will manage.
* Changelog

Modules can also call other modules using a module block, but we recommend keeping the module tree relatively flat and using module composition as an alternative to a deeply-nested tree of modules, because this makes the individual modules easier to re-use in different combinations.

## Standard Module Structure
The following files should always be present in standard modules:
* main.tf, variables.tf, outputs.tf. These are the recommended filenames for a minimal module, even if they're empty. main.tf should be the primary entrypoint. For a simple module, this may be where all the resources are created. For a complex module, resource creation may be split into multiple files but any nested module calls should be in the main file. variables.tf and outputs.tf should contain the declarations for variables and outputs, respectively.
* Data to the variable should be passed by var.tfvars. In this way, security of the sensitive data can be maintained. The data in the var.tfvars file passed as key-value pair format. key can be without Inverted Comma(e.g: resource_group), but the value should be in the inverted comma(e.g: "Example"). Generally this Keys nad values are seperated by equal to(=) sign. 
* Variables and outputs should have descriptions. All variables and outputs should have one or two sentence descriptions that explain their purpose. This is used for documentation. See the documentation for variable configuration and output configuration for more details.
* .gitignore - this file should be at the root of the repo and contain all the files that should be excluded from the repo: statefile, logs, credentials, etc.
* Nested modules. Nested modules should exist under the modules/ subdirectory. Any nested module with a README.md is considered usable by an external user. If a README doesn't exist, it is considered for internal use only. If the root module includes calls to nested modules, they should use relative paths like ./modules/consul-cluster so that Terraform will consider them to be part of the same repository or package, rather than downloading them again separately. See example of a nested module: https://github.com/terraform-google-modules/terraform-google-dataflow/tree/master/modules/dataflow_bucket

See standard module structure for more details.
https://www.terraform.io/docs/modules/index.html#standard-module-structure

## When to write a module
Hashicorp does not recommend writing modules that are just thin wrappers around single other resource types. The decision factor is the security controls that are needed to meet P&G guidelines, if there are specific settings (e.g. diagnostics logs) that have to be set for the resource(s) then a module should be used to isolate that logic and ensure it is always applied.

## Principles
- Don’t Repeat Yourself (DRY) principle: every piece of knowledge must have a single, unambiguous, authoritative representation within a system.

## Guidelines
- Every Terraform resource supports several lifecycle settings that configure how that resource is created, updated, and/or deleted. A particularly useful lifecycle setting is create_before_destroy.
- A data source represents a piece of read-only information that is fetched from the provider (in this case, AWS) every time you run Terraform. Adding a data source to your Terraform configurations does not create anything new; it’s just a way to query the provider’s APIs for data and to make that data available to the rest of your Terraform code. Each Terraform provider exposes a variety of data sources.
- If for some reason you need to manipulate the state file — which should be a relatively rare occurrence — use the terraform import or terraform state commands

## Backend
- The backend block in Terraform does not allow you to use any variables or references
- The only solution available as of May 2019 is to take advantage of partial configuration, in which you omit certain parameters from the backend configuration in your Terraform code and instead pass those in via -backend-config command-line arguments when calling terraform init.

## Workspaces
- Isolation via workspaces - useful for quick, isolated tests on the same configuration
- Isolation via file layout - useful for production use cases for which you need strong separation between environments
- Inside each of those workspaces, Terraform uses the key you specified in your backend configuration, so you should find an example1/workspaces-example/terraform.tfstate and an example2/workspaces-example/terraform.tfstate. In other words, switching to a different workspace is equivalent to changing the path where your state file is stored.
- You can change how that module behaves based on the workspace you’re in by reading the workspace name using the expression terraform.workspace
- To achieve full isolation between environments, you need to do the following: Put the Terraform configuration files for each environment into a separate folder.
- Configure a different backend for each environment, using different authentication mechanisms and access controls

## Naming Conventions

### Modules
All modules names must use only lowercase characteres and hyphens as separator (e.g. terraform-azure-key-vault).

The reference to the module must also have the same naming convention and a counter or unique string should be used for identifying the resource where there are multiple instance of the same resource in the same deployment, for example:

```
module "app_service_plan" {
	source = "./modules/services/app_service_plan/"
	app_service_plan_name = "${var.app_service_plan_name}"
	app_service_plan_loc = "${var.app_service_plan_loc}"
	rg_name = "${var.rg_name}"
	app_service_plan_kind = "${var.app_service_plan_kind}"
	app_service_plan_tier = "${var.app_service_plan_tier}"
	app_service_plan_size = "${var.app_service_plan_size}"
}
```

### Variables
All variables and outputs must use only lowercase characters and underscore as separator (e.g. rg_name).

When referencing variables in Terraform code (interpolation) always use the syntax inside quotes (e.g. "${var.rg_name}"), this makes it more manageable when parsing the Terraform code for automated processes.

## Policies (Open Policy Agent)
Open Policy Agent is the engine for defining deployment policies in Terraform. 

Default policies:
- Tags: all resources deployed must have required tags

## Modules Versioning
All modules must use semantic versioning [INSERT LINK TO SEMVER DOC]. Versions are assigned using git tags. After the initial reslease of the module every change to the module must have a different version assigned. 

Every module should have a CHANGELOG.md file that contains details about every release. 

## Azure Modules Standards

### Subscription, Resource Group, and Resource Name
In Azure resources have to be assigned to a subscription and a resource group. Resource Groups must not be created as part of the component modules. Every Azure modules must have the following parameters:

```
variable resource_group {
  type = "string"
  description = "Name of the resource group where the resource(s) will be deployed"
}

variable resource_name {
  type = "string"
  description = "Name of the resource to be deployed"
}
```

`Note:` when building blueprints that should have more than one resource group then every resource group should be requested as separate parameter.

### Context Information
Every module must have a provider specific to the subscription where resource will be deployed and a data source for subscription and resource group information.

```
provider "azurerm" {
  subscription_id = "${var.subscription_id}"
}

data "azurerm_subscription" "current" {
  subscription_id = "${var.subscription_id}"
}

data "azurerm_resource_group" "current" {
  name = "${var.resource_group}"
}
```

### Region
The default region for resources is the region of the Resource Group where resources are being deployed. Every module must have a way to overwrite the region in case specific resource has to be deployed to different region.   

Azure subscriptions in P&G tenant have a primary and a secondary region (DR). All resources must be deployed to those regions, if there is a need to use different region it requires approval from a Cloud Architect.

### Tags
Every resource deployed in P&G cloud environments must have the required tags [INSERT LINK TO TAGS DOCUMENTATION]. Other tags can be added to resources as needed.

Every module should have the following variables and should be used in the module with a merge `tags = merge("${var.additional_tags}","${var.default_tags}")` leaving the default_tags for last to replace any duplicates.

```
variable default_tags {
  type = map
  description = "Default tags for the resource"
}

variable additional_tags {
  type = map
  default = {}
  description = "Additional tags for the resource"
}
```

### Network ACLs
In P&G tenant the resources that support Network ACLs must have the peering firewall rules and subscription main vnet/subnet added by default. Modules for such resources should have the following parameters. The list of firewall rules and vnet/subnet will be a combination of the default values and the application-specific values.

```
variable network_acls_bypass {
  type = "string"
  default = "None"
  description = "Services to bypass in network acls, options are AzureServices or None"
}

variable ip_rules {
  type = "list(string)"
  default = [""]
  description = "List of application-specific firewall rules"
}

variable virtual_network_subnet_ids {
  type = "list(string)"
  default = [""]
  description = "List of application-specific vnet/subnet acl"
}
```
`Note:` For the firewall rules that allow individual IP address those should be done using CIDR notation (e.g. 137.10.10.5/32), otherwise Terraform will interpret as a change on every execution.