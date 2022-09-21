#____________________________________________________________
#
# Intersight Organization Data Source
# GUI Location: Settings > Settings > Organizations > {Name}
#____________________________________________________________

data "intersight_organization_organization" "org_moid" {
  name = var.organization
}

#____________________________________________________________
#
# Intersight Fiber-Channel Pool Resource
# GUI Location: Pools > Create Pool
#____________________________________________________________

resource "intersight_fcpool_pool" "fc_pool" {
  assignment_order = var.assignment_order
  description      = var.description != "" ? var.description : "${var.name} ${var.pool_purpose} Pool."
  name             = var.name
  pool_purpose     = var.pool_purpose
  dynamic "id_blocks" {
    for_each = { for v in var.id_blocks : v.from => v }
    content {
      object_type = "fcpool.Block"
      from        = id_blocks.value.from
      size        = id_blocks.value.size != null ? id_blocks.value.size : null
      to          = id_blocks.value.to != null ? id_blocks.value.to : null
    }
  }
  organization {
    moid        = data.intersight_organization_organization.org_moid.results[0].moid
    object_type = "organization.Organization"
  }
  dynamic "tags" {
    for_each = var.tags
    content {
      key   = tags.value.key
      value = tags.value.value
    }
  }
}
