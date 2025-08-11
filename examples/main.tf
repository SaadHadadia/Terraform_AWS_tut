terraform {

  # REMOTE AWS BACKEND
  backend "s3" {
    bucket         = "terraform-tut-aws-state" # Bucket name
    key            = "infra/terraform.tfstate"
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

################################
# 1. EXPRESSIONS
################################

# Strings (literal & template)
resource "aws_s3_bucket" "expr_bucket" {
  bucket = "${var.project_name}-${var.env}-expr" # Template string
}

# Operators (simple math for tags)
resource "aws_s3_bucket" "op_bucket" {
  bucket = "${var.project_name}-${10 + 5}-op" # '+' operator
}

# Conditionals (ternary)
resource "aws_s3_bucket" "cond_bucket" {
  bucket = var.env == "prod" ? "${var.project_name}-prod" : "${var.project_name}-nonprod"
}

################################
# 2. FUNCTIONS
################################

# Numeric function: abs()
resource "aws_s3_bucket" "num_func_bucket" {
  bucket = "${var.project_name}-${abs(-5)}-num"
}

# String functions: lower(), replace()
resource "aws_s3_bucket" "str_func_bucket" {
  bucket = lower(replace("${var.project_name} FUN", " ", "-"))
}

################################
# 3. META-ARGUMENTS
################################

# count
resource "aws_s3_bucket" "count_bucket" {
  count  = var.create_bucket ? 1 : 0
  bucket = "${var.project_name}-${var.env}-count"
}

# for_each
resource "aws_s3_bucket" "foreach_bucket" {
  for_each = toset(var.bucket_names)
  bucket   = "${var.project_name}-${each.key}"
}

# depends_on
resource "aws_s3_bucket" "dep_bucket" {
  bucket     = "${var.project_name}-${var.env}-dep"
  depends_on = [aws_s3_bucket.count_bucket]
}

# lifecycle
resource "aws_s3_bucket" "life_bucket" {
  bucket = "${var.project_name}-${var.env}-life"

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = [tags]
  }

  tags = {
    Owner = "Terraform"
  }
}