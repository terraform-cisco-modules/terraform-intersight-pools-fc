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
