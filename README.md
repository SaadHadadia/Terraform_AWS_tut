# Variables and Outputs

## Variables

### Variable block

must define variable block

```
variable "var_name" {
  description = "description"
  type        = string
  default     = "default value"
}
```

---

### Variable types
- string
- number
- bool
- list(<TYPE>)
- set(<TYPE>)
- map(<TYPE>)
- object({<ATTR NAME> = <TYPE>, ... })
- tuple([<TYPE>, ...])

---

### Variable files
`variables.tfvars` (or `<FILENAME>.auto.tfvars`) automatically applied 

---

### Apply default
`terraform apply`

---

### Apply a different variable file
`terraform apply -var-file=another-variable-file.tfvars`

---

### Passing Variable via Prompt
If value not specified, Terraform will prompt for value. (this is okay for testing... but don't depend on it since you should be automating things!)
```
  var.db_pass
  password for database

  Enter a value:
```

---

### Passing Variables via CLI
`terraform apply -var="db_pass=$DB_PASS_ENV_VAR"`


---

## Setting Input Variabls

In Order of precedence from lowest to highest

- Manual entry during plan/apply
- Default value in declaration block
- TF_VAR_\<name> environment variables
- terraforfm.tfvars file
- *.auto.tfvars file
- Command line -var or -var-file

---

## Local Variables

Allows you to store the value of expression for reuse but doesn't allow for passing in values 
```
locals {
  service_name = "forum"
  owner        = "Community Team"
}
```

---

## Output Variables

Allows you to output some value  (which might not be known ahead of time).

For example it might be useful to know the IP address of a VM that was created:

```
output "instance_ip_addr" {
  value = aws_instance.instance.private_ip
}
```

Sample output:
```
db_instance_addr = "terraform-20210504182745335900000001.cr2ub9wmsmpg.us-east-1.rds.amazonaws.com"
instance_ip_addr = "172.31.24.95"
```

Will be output after `terraform apply` or `terraform output`

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)
