# Remote Backend Setup

## Overview

Remote backends enable storage of TF state in a remote, location to enable secure collaboration.

Initialize backend in AWS and manage it with Terraform using **AWS S3 & Dynamo DB**

---

### Bootstraping process

1. Use config from **local state**
1. (init, plan, apply) to provision s3 bucket and dynamoDB table with local state config
1. Specify the remote Backend

---

## Author
* This repository was created and is maintained by [Saad Hadadia](https://github.com/SaadHadadia/)
