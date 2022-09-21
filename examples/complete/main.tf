module "wwpn_pool" {
  source  = "scotttyso/pools-fc/intersight"
  version = ">= 1.0.1"

  assignment_order = "sequential"
  description      = "Demo WWPN Pool"
  id_blocks = [
    {
      from = "00:00:00:25:B5:00:00:00"
      size = 1000
    }
  ]
  name         = "default"
  organization = "default"
  pool_purpose = "WWPN"
}

