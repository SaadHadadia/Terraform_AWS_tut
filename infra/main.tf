terraform {

  ## TO SWITCH FROM LOCAL BACKEND TO REMOTE AWS BACKEND
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
  region = "us-east-1"
}

resource "aws_instance" "terraform-tut-aws-instance" {
  ami           = "ami-011899242bb902164" # Ubuntu 20.04 LTS // us-east-1
  instance_type = "t2.micro"
}
