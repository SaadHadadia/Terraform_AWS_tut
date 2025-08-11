# Terraform & AWS Project

## Overview

This project provisions basic infrastructure on AWS using Terraform.

---

## Content

1. [Overview + Setup](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/first-instance)
1. [Remote Backend Setup](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/remote-backend)
1. [Basic Infrastructure Configuration](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/infra-basic-setup)
1. [Variables and Outputs](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/vars_outputs)
1. [Language Features](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/lang-features)
1. [Organization and Modules](https://github.com/SaadHadadia/Terraform_AWS_tut/tree/org-mods)
1. [Managing Multiple Environments]()
1. [Testing]()
1. [Developer Workflows + CI/CD]()

---

## Live Project

You can view the live deployed project here:

👉[http://www.tiltao.site/](http://www.tiltao.site/)

**Notes :**
- The website is not protected by an SSL certificate so it may apear as not secure.
- The link to the live demo may not be working because of that the infrastructure is destroyed.

---

## Architecture
![](architecture.png)

---

## Requirements

- Terraform v1.0.0 or higher
- AWS CLI configured with appropriate credentials

---

## Providers

- AWS (default provider)

---

## Modules
This project utilizes the following Terraform modules:

- **DynamoDB:** Provisions DynamoDB tables with configurable capacity and indexes.

- **EC2:** Creates EC2 instances with customizable configurations and networking.
- **RDS:**  Sets up RDS instances for relational databases with various engine support.
- **Route 53:** Manages DNS records and hosted zones for domain name resolution.
- **S3:** Creates S3 buckets with features like versioning, encryption, and lifecycle policies.
- **IAM:** Manages IAM roles, policies, and groups to control access permissions.

---

## Usage

1. Clone the repository:

```bash
git clone https://github.com/SaadHadadia/Terraform_AWS_tut.git
cd Terraform_AWS_tut
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply the configuration:

```bash
terraform apply
```

4. To destroy the infrastructure:

```bash
terraform destroy
```

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)
