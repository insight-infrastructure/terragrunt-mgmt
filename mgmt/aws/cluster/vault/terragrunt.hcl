terraform {
  source = "github.com/insight-w3f/terraform-aws-vault.git?ref=${local.vars.versions.network}"
}

include {
  path = find_in_parent_folders()
}

locals {
  vars = read_terragrunt_config(find_in_parent_folders("variables.hcl")).locals
  network = find_in_parent_folders("network")
}

dependencies {
  paths = [local.network]
}

dependency "network" {
  config_path = local.network
}

inputs = {
  vpc_name = dependency.network.outputs.vpc_id
  subnet_ids = dependency.network.outputs.public_subnets
  security_group_id = dependency.network.outputs.vault_security_group_id
}
