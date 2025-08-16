
# terraform-module-app

## Project Explanation

`terraform-module-app` is a modular Terraform project designed to simplify and standardize the provisioning of AWS infrastructure across multiple environments (such as development, staging, and production). The project leverages reusable modules to ensure consistency, reduce code duplication, and enable rapid infrastructure deployment.

### Key Features
- **Modular Design:** Infrastructure components (EC2, S3, DynamoDB, etc.) are defined as reusable modules, making it easy to manage and scale environments.
- **Environment Specificity:** Quickly spin up isolated environments (dev, staging, etc.) by changing a few variables.
- **Best Practices:** Encourages the use of remote state, state locking, and unique resource naming to avoid conflicts and ensure safe collaboration.
- **Cross-Platform:** Works on macOS, Linux, and Windows, with clear setup instructions for each.

### What You Can Do With This Project
- Launch EC2 instances with custom AMIs and instance types
- Create and manage S3 buckets and DynamoDB tables
- Use different configurations for different environments
- Easily destroy and recreate infrastructure as needed

This project is ideal for teams or individuals looking to adopt Infrastructure as Code (IaC) with Terraform, while following AWS and Terraform best practices.

---

## Project Structure

- `infra-app/` — The reusable Terraform module for infrastructure (EC2, S3, etc.)
- `main.tf` — Example usage of the module for different environments (dev, staging, etc.)

---

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) (v1.0+ recommended)
- An AWS account
- AWS credentials configured on your machine

---

## AWS CLI & Credentials Setup

### Mac & Linux
1. Install AWS CLI:
   ```sh
   curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
   sudo installer -pkg AWSCLIV2.pkg -target /
   # Or use Homebrew:
   brew install awscli
   ```
2. Configure credentials:
   ```sh
   aws configure
   ```
   Enter your AWS Access Key, Secret Key, region (e.g., `ap-south-1`), and output format.

### Windows
1. Download and install the AWS CLI from [here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
2. Open Command Prompt or PowerShell and run:
   ```sh
   aws configure
   ```
   Enter your AWS Access Key, Secret Key, region, and output format.

---

## Usage

1. Clone this repository and navigate to the `terraform-module-app` directory:
   ```sh
   git clone <repo-url>
   cd terraform-module-app
   ```
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Review the plan:
   ```sh
   terraform plan
   ```
4. Apply the configuration:
   ```sh
   terraform apply
   ```
   Confirm with `yes` when prompted.
5. To destroy resources:
   ```sh
   terraform destroy
   ```

---

## Notes
- Edit `main.tf` to customize environments and module variables.
- Use unique names for AWS resources to avoid conflicts.
- Never commit AWS credentials or `.tfstate` files to version control.

---

## References
- [Terraform Documentation](https://www.terraform.io/docs/)
- [AWS CLI Documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
