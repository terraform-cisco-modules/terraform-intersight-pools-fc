#____________________________________________________________
#
# Fibre-Channel Pool Variables Section.
#____________________________________________________________

variable "assignment_order" {
  default     = "default"
  description = <<-EOT
  Assignment order decides the order in which the next identifier is allocated.
    * sequential - Identifiers are assigned in a sequential order.
    * default - Assignment order is decided by the system.
  EOT
  type        = string
}

variable "description" {
  default     = ""
  description = "Description for the Fiber-Channel Pool."
  type        = string
}

variable "id_blocks" {
  default     = []
  description = <<-EOT
  List of WWxN's Configuration Parameters to Assign to the Fiber-Channel Pool.
    * from - Staring WWxN Address.  An Example is "20:00:00:25:B5:00:00:00".
    * size - Size of WWxN Pool.  An Example is 1000.
    * to - Ending WWxN Address.  An Example is "20:00:00:25:B5:00:03:E7".
    * IMPORTANT NOTE: You can only Specify `size` or `to` on initial creation.  This is a limitation of the API.
  EOT
  type = list(object(
    {
      from = string
      size = optional(number, null)
      to   = optional(string, null)
    }
  ))
}

variable "name" {
  default     = "default"
  description = "Name for the Fiber-Channel Pool."
  type        = string
}

variable "organization" {
  default     = "default"
  description = "Intersight Organization Name to Apply Policy to.  https://intersight.com/an/settings/organizations/."
  type        = string
}

variable "pool_purpose" {
  default     = "WWPN"
  description = <<-EOT
  What type of Fiber-Channel Pool is this.  Options are:
    * WWNN
    * WWPN
  EOT
  type        = string
}

variable "tags" {
  default     = []
  description = "List of Tag Attributes to Assign to the Policy."
  type        = list(map(string))
}
