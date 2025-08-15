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

---

# Integrating a Common Backend for Remote State Locking

This section explains how to set up and integrate a common backend for remote state locking using Terraform. It demonstrates integrating a shared backend (e.g., S3 with DynamoDB for state locking) and connecting your `ec2` module to the `remoteInfra` backend.

## 1. Create a Common Remote Backend

In your `remoteInfra` directory, define the backend resources (e.g., S3 bucket and DynamoDB table):

```hcl
# remoteInfra/main.tf
resource "aws_s3_bucket" "terraform_state" {
	bucket = "your-unique-terraform-state-bucket"
	acl    = "private"
}

resource "aws_dynamodb_table" "terraform_locks" {
	name         = "terraform-locks"
	billing_mode = "PAY_PER_REQUEST"
	hash_key     = "LockID"

	attribute {
		name = "LockID"
		type = "S"
	}
}
```

Apply this configuration in the `remoteInfra` directory:

```sh
cd remoteInfra
terraform init
terraform apply
```

## 2. Configure Backend in Other Modules (e.g., ec2)

In your `ec2` module, configure the backend to use the remote state:

```hcl
# ec2/terraform.tf
terraform {
	backend "s3" {
		bucket         = "your-unique-terraform-state-bucket"
		key            = "ec2/terraform.tfstate"
		region         = "ap-south-1"
		dynamodb_table = "terraform-locks"
		encrypt        = true
	}
}
```

## 3. Initialize and Migrate State

After updating the backend configuration, initialize the backend in your `ec2` directory:

```sh
cd ec2
terraform init
```
Terraform will prompt to migrate your state to the new backend. Confirm to proceed.

## 4. Best Practices
- Use unique S3 bucket names.
- Enable versioning on the S3 bucket for state recovery.
- Restrict access to the S3 bucket and DynamoDB table.
- Never commit state files to git.

---

## 5. Creation of Workspace and management
- Create new workspace -> terraform workspace new <workspace_name>
- Switch to different workspace -> terraform workspace select <workspace_name>
- Delete the workspace -> terraform workspace delete <workspace_name>
- To the number of workspace -> terraform workspace list
- To the in which workspace you are working -> terraform workspace show

## 6. git commands to manage the workspace with the branch
- git checkout -b <branch_name> -> this create new branch
- git checkout <branch_name> -> to switch the branch

## 7. Import the resources from cloud services
- terraform import aws_instance.definednameOfInstance_inTerraform instance_id
- terraform state list
- terraform state show <resource_name>
- terraform state rm <resource_name>
- terraform state mv <src> <dest>
---

## References
- [Terraform Remote State](https://www.terraform.io/docs/language/state/remote.html)
- [Terraform S3 Backend](https://www.terraform.io/docs/language/settings/backends/s3.html)

This setup ensures safe, collaborative infrastructure management with remote state and locking.
