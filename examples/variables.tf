variable "region" {
  description = "Default region for provider"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Base project name"
  type        = string
}

variable "env" {
  description = "Environment (dev, prod)"
  type        = string
  default     = "dev"
}

variable "create_bucket" {
  description = "Whether to create count_bucket"
  type        = bool
  default     = true
}

variable "bucket_names" {
  description = "Names for for_each example"
  type        = list(string)
  default     = ["alpha", "beta"]
}
