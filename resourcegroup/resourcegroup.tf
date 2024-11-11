variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

module "base_rg" {
  source          = "git::https://github.com/Devacc29/terragrunt-module.git//modules/resourcegroup"
  resource_groups = var.resource_groups
}