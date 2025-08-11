# Organization & Modules

## Overview

Organizing Terraform configurations into reusable modules is a best practice that enhances scalability, maintainability, and collaboration. Modules allow you to encapsulate infrastructure components, making your code more modular and easier to manage across different environments.

---

## Goals
- Separate Terraform code into **logical modules** (e.g., S3, EC2, VPC)
- Use a **root module** per environment (dev, prod, staging)
- Centralize **variables** and **outputs** where possible
- Make the codebase easy to navigate and extend

---

## Types of Modules

### Root Module

The default module where Terraform operations are executed. It typically contains:

- Provider configurations
- Resource definitions
- Module calls

```py
module "vpc" {
  source = "../modules/vpc"
}
```

### Child Module

A reusable module that can be called by the root module or other modules. It encapsulates specific functionality.


```py
# modules/vpc/main.tf
resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}
```

### Module Sources

Modules can be sourced from various locations:

#### Local Path

```py
module "web-app" {
    source = "../web-app"
}
```

#### Terraform Registry

```py
module "consul" {
    source  = "hashicorp/consul/aws"
    version = "0.1.0"
}
```

#### GitHub

```py
# HTTP
module "example" {
    source = "github.com/username/repo.git/pathToModule?ref=main"
    
}
# SSH
module "example" {
    source = "git@github.com:username/repo.git/pathToModule"
}

# Generic GitHub repo
module "example" {
    source = "git@github.com:username@example.com/repo.git"
}
```

---

## Inputs and Meta-Arguments

### Inputs

Modules can accept input variables to customize their behavior.

```py
# modules/vpc/variables.tf
variable "cidr_block" {
  type = string
}
```

```py
# root/main.tf
module "vpc" {
  source     = "../modules/vpc"
  cidr_block = "10.0.0.0/16"
}
```

### Meta-Arguments

Special arguments that control resource behavior:

- `count`: Creates multiple instances of a resource.
- `for_each`: Creates multiple instances based on a map or set.
- `depends_on`: Specifies explicit dependencies between resources.
- `lifecycle`: Controls resource creation and destruction behavior.

```py
resource "aws_instance" "example" {
  count = 2
  ami   = "ami-12345678"
  type  = "t2.micro"

  tags = {
    Name = "Instance ${count.index}"
  }
}
```

---

## Best Practices

- **Modularization:** Break down infrastructure into reusable modules.
- **Separation of Concerns:** Keep environment-specific configurations separate.
- **Version Control:** Use version constraints for module sources.
- **Input Validation:** Define input variable types and descriptions.
- **Outputs:** Expose necessary information using output variables.


---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)
