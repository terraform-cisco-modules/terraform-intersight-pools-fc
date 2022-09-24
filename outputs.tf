#____________________________________________________________
#
# Collect the moid of the Fibre-Channel Pool as an Output
#____________________________________________________________

output "moid" {
  description = "WWxN Pool Managed Object ID (moid)."
  value       = intersight_fcpool_pool.fc.moid
}
