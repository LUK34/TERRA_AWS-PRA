# Terraform using AWS Practice

- Link to refer document containing resources in terraform:
- https://registry.terraform.io/providers/hashicorp/aws/


## Terraform Workflow:
- **terraform init**
- Initializes Terraform in the working directory.

- **terraform validate**
- Is used to check the syntax and validity of your Terraform configuration files before applying any changes. 
- It ensures that the Terraform code is syntactically correct but does not check resource availability or connectivity with the cloud provider

- **terraform plan**
- Shows what Terraform will do before applying changes.

- **terraform apply --auto-approve**
- Executes the Terraform configuration and provisions (or updates) infrastructure without prompting for manual confirmation.

- **terraform destroy --auto-approve**
- Permanently deletes all Terraform-managed infrastructure without requiring manual confirmation.

- **terraform state**
- Terraform state is a crucial part of Terraform's infrastructure management.
- It acts as a mapping between Terraform configurations and real-world infrastructure resources. Terraform stores this state in a file (terraform.tfstate)

- **terraform state list**
- The terraform state list command is used to list all resources managed in the Terraform state. 
- It helps identify which resources are tracked and their Terraform identifiers.


## Tainting concept of terraform:
- Terraform "taint" is used to replace the resource when we apply the script next time.

- **Example 1: How to apply taint:**
- terraform taint aws_instance.vm1
- terraform apply --auto-approve

- **Example 2: Instead of using taint use replace as shown below. The below code is enough:**
- terraform apply -replace="aws_instance.vm1" --auto-approve

## Terraform Concepts:
- **Provider:** Terraform interacts with cloud providers (AWS, Azure, GCP, etc.) and services via providers.
- **Resources:** Resources are the fundamental building blocks in Terraform, representing infrastructure components such as EC2 instances, S3 buckets, databases, etc.
- **Variables:** Used to make configurations dynamic.
- **Outputs:** Outputs allow Terraform to display values after execution.
- **State Files:** Terraform maintains a state file that tracks resources it manages. State can be stored locally or remotely (e.g., in an S3 bucket for AWS).
- **Modules:** A module is a container for multiple Terraform configurations that can be reused.
- **Backend:** Defines where Terraform stores its state file (local or remote like S3, Azure Blob, etc.

- **GENERAL CMDS:**
- $env:AWS_ACCESS_KEY_ID = ""
- $env:AWS_SECRET_ACCESS_KEY = ""
- $env:AWS_REGION = ""
- terraform init
- terraform workspace show
- terraform workspace new dev
- terraform workspace new qlty
- terraform workspace list
- terraform workspace select dev
- terraform plan -var-file="dev.tfvars"
- terraform apply -var-file="dev.tfvars" -auto-approve
- terraform destroy -var-file="dev.tfvars" -auto-approve

## 01-EC2-SINGLE
- Single instane of EC2 is created here.

## 02-EC2-multiple
- Atmost 4 instances are created here using for loop -> for_each.

## 03-S3-SINGLE
- Single instance of S3 is created here.

## 04-S3-multiple
- 3 instance of S3 bucker are created here using for loop -> for_each.


## 05-IAM-SINGLE
- **1. Create an IAM User**
- Creates an IAM user with the name and path provided via variables.
- Tags the user using a key named tag-key and a value from var.iam_user_tag.
- **2. Create IAM Access Key**
- Generates programmatic access credentials (access key ID and secret access key) for the IAM user lrm.
- These keys are used for AWS CLI or API access.
- Sensitive – You should handle the output securely using Terraform outputs with sensitive = true.
- **3. Define an IAM Policy Document**
- Uses a data block to define a policy inline (without attaching a managed policy).
- It accepts:
- effect: Usually Allow or Deny.
- actions: List of allowed or denied actions like "s3:GetObject".
- resources: ARNs of AWS resources the user can interact with.
- This dynamically builds a JSON IAM policy document based on the input variables.
- **4. Attach Inline Policy to User**
- Attaches the above policy directly to the IAM user as an inline policy.
- Inline policies are user-specific, unlike managed policies which are reusable.
- **Summary of Outputs You Could Get**
- The IAM user's name or ARN.
- The access key and secret (only immediately after creation).
- The policy document in JSON (for debugging).














