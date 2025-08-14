# How to Run Terraform

This guide explains how to run Terraform to manage your infrastructure.

## Prerequisites
- [ ] Install [Terraform](https://www.terraform.io/downloads.html)
- [ ] Configure your cloud provider credentials (e.g., AWS, Azure, GCP)

## Steps

### 1. Initialize the Terraform Working Directory
Run this command in your Terraform project directory:

```sh
terraform init
```
This command downloads the required provider plugins and sets up the backend.

### 2. Review the Terraform Plan
Check what changes Terraform will make:

```sh
terraform plan
```
This shows the actions Terraform will take without making any changes.

### 3. Apply the Terraform Configuration
To create or update your infrastructure, run:

```sh
terraform apply
```
You will be prompted to confirm before any changes are made.

### 4. Destroy the Infrastructure (Optional)
To remove all resources managed by Terraform:

```sh
terraform destroy
```

## Tips
- Always review the plan before applying changes.
- Use version control (e.g., git) to track your Terraform files.
- Store sensitive variables securely (e.g., use environment variables or a secrets manager).

---
For more details, see the [Terraform documentation](https://www.terraform.io/docs/index.html).
