# Testing

## Overview

Testing in Terraform ensures that infrastructure changes are correct, secure, and do not cause unexpected issues before deployment.

---

## Static checks

### Built in

#### Format
Enforces style rules for your configurations.
```
terraform fmt -check # checks if formatter would make chances

terraform fmt # applies those changes
```

#### Validate
Checks that configuration are valid.

Terraform init is required to use validate. If not working with a remote backend, `terraform init -backend=false` can be used.
```
terraform validate
```

#### Plan
Looking at the resulting Terraform plan can help catch bugs.
```
terraform plan
```

#### Custom Validation Rules
Enforce conditions on variables to prevent misuse
```
variable "short_variable" {
  type = string

  validation {
    condition = length(var.short_variable) < 4
    error_message = "The short_variable value must be less than 4 characters!"
  }
}
```

### External

There are many 3rd party tools which can check Terraform configurations for potential issues and/or suggest best practices:
- [tflint](https://github.com/terraform-linters/tflint)
- [checkov](https://github.com/bridgecrewio/checkov)
- [terrascan](https://github.com/accurics/terrascan)
- [terraform-compliance](https://terraform-compliance.com/)
- [snyk](https://support.snyk.io/hc/en-us/articles/360010916577-Scan-and-fix-security-issues-in-your-Terraform-files)
- [Terraform Sentinel](https://www.terraform.io/docs/cloud/sentinel/index.html)

---

## Automated Tests

You can run automated tests with Bash, Python, or any scripting language to verify modules and outputs.

Example (Bash):

```
#!/bin/bash
set -e

terraform init
terraform plan -out=plan.out
terraform show -json plan.out | jq .
```

---

## Terratest

[Terratest](https://terratest.gruntwork.io/) is a Go library for automated infrastructure testing.

Example:

```go
package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformHelloWorldExample(t *testing.T) {
	// website::tag::2:: Construct the terraform options with default retryable errors to handle the most common
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// website::tag::1:: Set the path to the Terraform code that will be tested.
		TerraformDir: "../examples/terraform-hello-world-example",
	})

	// website::tag::5:: Clean up resources with "terraform destroy" at the end of the test.
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::3:: Run "terraform init" and "terraform apply". Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	// website::tag::4:: Run `terraform output` to get the values of output variables and check they have the expected values.
	output := terraform.Output(t, terraformOptions, "hello_world")
	assert.Equal(t, "Hello, World!", output)
}
```

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)
