# General Variables

variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

locals {
  environment_name = "staging"
}

# Web application variables

variable "configs" {
  type = list(object({
    bucket_prefix    = string
    domain           = string
    app_name         = string
    instance_type    = string
    create_dns_zone  = bool
    db_name          = string
    db_user          = string
    db_pass          = string
  }))
}