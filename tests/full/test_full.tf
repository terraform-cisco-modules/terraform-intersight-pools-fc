terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.32"
    }
  }
}

# Setup provider, variables and outputs
provider "intersight" {
  apikey    = var.intersight_keyid
  secretkey = file(var.intersight_secretkeyfile)
  endpoint  = var.intersight_endpoint
}

variable "intersight_keyid" {}
variable "intersight_secretkeyfile" {}
variable "intersight_endpoint" {
  default = "intersight.com"
}
variable "name" {}

output "moid" {
  value = module.main.moid
}

# This is the module under test
module "main" {
  source           = "../.."
  assignment_order = "sequential"
  description      = "${var.name} WWPN Pool."
  id_blocks = [
    {
      from = "20:00:00:25:B5:00:00:00"
      size = 1000
    }
  ]
  name         = var.name
  organization = "terratest"
  pool_purpose = "WWPN"
}
