# Managing Multiple Environments

## Overview

Terraform workspaces allow you to manage multiple environments (e.g., `dev`, `staging`, `production`) using the same configuration.
They’re useful for avoiding duplicate folder structures, but **require careful handling**.

---

## Example Commands

```
# Create a new workspace
terraform workspace new production

# List available workspaces
terraform workspace list

# Switch to another workspace
terraform workspace select staging
```

---

## Warning

Manually switching environments can be risky:

- You might accidentally deploy resources to the wrong environment.
- State files are isolated per workspace, so wrong selection can lead to unexpected changes.
- Always double-check the current workspace before running terraform `apply`:

```
terraform workspace show
```

---

## Best Practices

- Use automation/scripts to select the correct workspace.
- Keep environment-specific variables in separate `.tfvars` files.
- Combine workspaces with a remote backend for better state management.

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)