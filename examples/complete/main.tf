module "wwpn_pool" {
  source  = "terraform-cisco-modules/pools-fc/intersight"
  version = ">= 1.0.2"

  assignment_order = "sequential"
  description      = "Demo WWPN Pool"
  id_blocks = [
    {
      from = "20:00:00:25:B5:00:00:00"
      size = 1000
    }
  ]
  name         = "default"
  organization = "default"
  pool_purpose = "WWPN"
}

