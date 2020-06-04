terraform {
  source = "github.com/trussworks/terraform-aws-cloudtrail.git?ref=${local.vars.versions.network}"
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
