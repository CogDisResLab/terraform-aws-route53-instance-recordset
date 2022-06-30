variable "private_zone" {
  description = "ID of the zone with the private dns records"
  type        = string
}

variable "public_zone" {
  description = "ID of the zone with the public dns records"
  type        = string
}

variable "reverse_zone" {
  description = "ID of the zone with the reverse dns records"
  type        = string
}

variable "public" {
  description = "Whether or not the instance is in the public subnet"
  default     = false
}

variable "domain_name" {
  description = "The domain name for the dns records"
}

variable "instance" {
  description = "The instance you need to generate the recordset for"
  default     = {}
}
