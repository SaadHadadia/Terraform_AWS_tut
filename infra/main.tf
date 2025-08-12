terraform {

  # REMOTE AWS BACKEND
  backend "s3" {
    bucket         = "terraform-tut-aws-state" # Bucket name
    key            = "infra/workspaces/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "web_app" {
  for_each = { for idx, cfg in var.configs : idx => cfg }

  source = "../infra-modules"

  # Input Variables
  bucket_prefix    = "${each.value.bucket_prefix}-${local.environment_name}"
  domain           = each.value.domain
  app_name         = each.value.app_name
  environment_name = local.environment_name
  instance_type    = each.value.instance_type
  create_dns_zone  = terraform.workspace == "production" ? true : false
  db_name          = "${local.environment_name}-${each.value.db_name}"
  db_user          = each.value.db_user
  db_pass          = each.value.db_pass
}