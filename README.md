# Overview + Setup

## Overview

Terraform overview and setup instructions.

Includes basic hello world terraform config to provision a single AWS EC2 instance.

---

## IAM Policies Assigned

The following AWS managed IAM policies are attached to the terraform-tut-access group:

- AmazonDynamoDBFullAccess
- AmazonEC2FullAccess
- AmazonRDSFullAccess
- AmazonRoute53FullAccess
- AmazonS3FullAccess
- IAMFullAccess

These policies provide comprehensive permissions for managing DynamoDB, EC2, RDS, Route 53, S3, and IAM resources.

---

## Hello World
./main.tf contains minimal configuration to provision an EC2 instance.

1. aws configure
1. terraform init
1. terraform plan
1. terraform apply

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)