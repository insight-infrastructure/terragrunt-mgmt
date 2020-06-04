terraform {
  source = "github.com/< aditya >/terraform-insight-auth-demo.git?ref=${local.vars.versions.demo}"
}

include {
  path = find_in_parent_folders()
}

locals {
  vars = read_terragrunt_config(find_in_parent_folders("variables.hcl")).locals
}

inputs = {
  vpc_name = local.vars.id
}
