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

## 06-IAM-multiple
- Same as previous but to create multiple users.


## 07-IAM_ROLE_GROUP_POLICY-SINGLE
- **IAM ROLE**
- Think of it like a temporary identity with specific permissions.
- It can be assumed by users or services (like EC2, Lambda).
- No username/password — instead, it’s used by trusted entities.
- Used when a resource needs access to something (e.g., EC2 accessing S3).
- Example: A role that allows EC2 to read/write from an S3 bucket.
- **IAM GROUP**
- A collection of IAM users.
- You assign policies to the group, and all users in the group inherit those permissions.
- Makes it easy to manage multiple users with the same set of permissions.
- Example: A “Developers” group that gives all devs access to code repositories.
- **IAM Policy**
- A document (in JSON) that defines permissions.
- It specifies what actions are allowed or denied on which AWS resources.
- Can be attached to a user, group, or role.
- Example: A policy that allows “read-only” access to all S3 buckets.

## 08-VPC
- **VPC (Virtual Private Cloud)**
- A virtual network you create inside AWS.
- It’s like your own private data center in the cloud.
- You can launch EC2, RDS, and other resources inside a VPC.
- You control the IP range, subnets, route tables, firewalls (security groups & NACLs), etc.
- It isolates your resources from other AWS customers.
- Think of a VPC as your custom-designed network in the cloud.
- **CIDR Block (Classless Inter-Domain Routing)**
- Defines the IP address range for your VPC or subnet.
- Written like this: 10.0.0.0/16
- 10.0.0.0 is the starting IP address.
- /16 is the prefix, meaning 65,536 IPs (2⁶⁴ - 2 reserved IPs per subnet).
- Smaller blocks (e.g., /24) give fewer IPs (256 in /24).
- Used to plan and segment your network.
- CIDR block = tells what IP addresses your network can use.

## 09-VPC-subnet
- **VPC (Virtual Private Cloud)**
- A virtual network you create inside AWS.
- It’s like your own private data center in the cloud.
- You can launch EC2, RDS, and other resources inside a VPC.
- You control the IP range, subnets, route tables, firewalls (security groups & NACLs), etc.
- It isolates your resources from other AWS customers.
- Think of a VPC as your custom-designed network in the cloud.
- **CIDR Block (Classless Inter-Domain Routing)**
- Defines the IP address range for your VPC or subnet.
- Written like this: 10.0.0.0/16
- 10.0.0.0 is the starting IP address.
- /16 is the prefix, meaning 65,536 IPs (2⁶⁴ - 2 reserved IPs per subnet).
- Smaller blocks (e.g., /24) give fewer IPs (256 in /24).
- Used to plan and segment your network.
- CIDR block = tells what IP addresses your network can use.
-**Public Subnet**
- A subnet that has internet access via Internet Gateway.
- Any resource (like EC2) inside it can be accessed from the internet, if security groups allow.
- You add a route to the Internet Gateway in the route table.
- Analogy: A house with a door facing the main road – visible to outsiders.
- **Private Subnet**
- A subnet that does not have direct internet access.
- Used for internal services like databases (RDS), backend apps, etc.
- No route to Internet Gateway.
- Can access the internet only through a NAT Gateway (for updates etc.).
- Analogy: A house in a gated colony – not directly visible to outsiders.
- **Internet Gateway (IGW)**
- A gateway between your VPC and the internet.
- Must be attached to the VPC.
- Needed for public subnets to allow internet access (e.g., SSH into EC2).
- Analogy: The main gate of your network that opens to the public road (internet).
- **NAT Gateway (Network Address Translation)**
- Allows instances in private subnets to access the internet (e.g., for updates, downloads).
- Blocks incoming traffic from the internet — keeps your resources secure.
- Placed in a public subnet and used via a route table.
- Analogy: A guarded exit tunnel – lets people go out but not come in.
- **cidrsubnet(var.vpc_cidr, 8, each.value + 100)**
- This generates a new subnet CIDR block from a base CIDR (var.vpc_cidr), using:
- 8 new subnet bits,
- each.value + 100 as the index.
- var.vpc_cidr: Base network (e.g., 10.0.0.0/16)
- Number of bits to increase the subnetting (i.e., make /24 blocks from /16)
- each.value + 100: Offset to determine which subnet block to generate
- What It Does:
- It splits your VPC CIDR (like 10.0.0.0/16) into smaller subnet blocks (like /24) and picks the (each.value + 100)-th one.
- Example:
- If var.vpc_cidr = "10.0.0.0/16" and each.value = 0, then:
- cidrsubnet("10.0.0.0/16", 8, 100) will return:
- 10.0.100.0/24
- If each.value = 1, it becomes:
- 10.0.101.0/24, and so on.
- **tolist(data.aws_availability_zones.available.names)[each.value]**
- Purpose:
- This picks an availability zone (AZ) from the list of available zones based on the each.value index.
- What It Does:
- data.aws_availability_zones.available.names: Returns a list of AZs, e.g., ["us-east-1a", "us-east-1b", "us-east-1c"]
- tolist(...): Ensures it's a proper list (sometimes needed in loops)
- [each.value]: Picks the AZ based on the current loop index
- Example:
- If:
- data.aws_availability_zones.available.names = ["us-east-1a", "us-east-1b", "us-east-1c"]
- And each.value = 1, then:
- tolist(data.aws_availability_zones.available.names)[1]
- Returns "us-east-1b"


## 10-EC2-SINGLE-taint
- Difference between `taint` and `replace`

- **taint**
- **Purpose:** Marks an existing resource for destruction and recreation on the next apply.
- **Command:** terraform taint <resource_type>.<resource_name>
- **When used:** When you manually decide that a resource is "bad" (e.g., misconfigured or corrupted), and needs to be recreated.
- **Effect:** On the next terraform apply, the tainted resource is destroyed first, then recreated.
- **State Impact:** Only updates the state file to mark the resource as tainted.

- terraform apply -replace
- **Purpose:** Forces recreation of a specific resource during that apply operation.
- **Command:** terraform apply -replace=<resource_type>.<resource_name>
- **When used:** When you want to replace a resource in one step without tainting it first.
- **Effect:** Replaces the resource as part of the current apply – no need for a separate taint step.
- **State Impact:** Terraform destroys and recreates the resource during the apply.

- To understand `taint` process we execute the below commands:
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
- terraform taint aws_instance.lrm_v1
- terraform apply -var-file="dev.tfvars" -auto-approve
- terraform destroy -var-file="dev.tfvars" -auto-approve

## 11-EC2-S3-taint
- To understand `taint` process we execute the below commands:
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
- terraform taint aws_instance.lrm_v1
- terraform apply -var-file="dev.tfvars" -auto-approve
- terraform destroy -var-file="dev.tfvars" -auto-approve

- To understand `replace` process we execute the below commands:
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
- terraform apply -var-file="dev.tfvars" -replace="aws_instance.lrm_v1" -auto-approve
- terraform destroy -var-file="dev.tfvars" -auto-approve

## 12-modules_part_1
- **This is quite overwhelming as multiple resources are added here**
- A Terraform module is just a set of Terraform configuration files. 
- Modules are just Terraform configurations inside a folder - there's nothing special about them. 
- In fact, the code you’ve been writing so far is a module: the root module. For this lab, we'll create a local module for a new server configuration.
- **Step 1.1:** Create a new directory called server in your /workspace/terraform directory and create a new file inside of it called server.tf.
- **Step 1.2:** Edit the file server/server.tf, with the following contents:
- **Step 1.3:** In your root configuration (also called your root module) /workspace/terraform/main.tf,
- we can call our new server module with a Terraform module block. Remember that terraform only works with the configuration files that are in it's current working directory.
- Modules allow us to reference Terraform configuration that lives outside of our working directory.
- In this case we will incorporate all configuration that is both inside our working directory (root module) and inside the server directory (child module).
- **Step 1.4:** Now run terraform init to install the module. Terraform configuration files located within modules are pulled down by Terraform during initialization, 
so any time you add or update a module version you must run a terraform init.
- **CMDS:**
- $env:AWS_ACCESS_KEY_ID = ""
- $env:AWS_SECRET_ACCESS_KEY = ""
- $env:AWS_REGION = ""
- terraform init
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve

## 12-modules_part_2
- ** Much more simpler and easier to understand than `12-modules_part_1`. Here workspace concept is applied. There is no enviroment variables here.**
- **CMDS:**
- $env:AWS_ACCESS_KEY_ID = ""
- $env:AWS_SECRET_ACCESS_KEY = ""
- $env:AWS_REGION = ""
- terraform init
- terraform workspace show
- terraform workspace new dev
- terraform workspace new qlty
- terraform workspace list
- terraform workspace select dev
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve

## 12-modules_part_3 
- **IMPORTANT**
- ** modules + workspace + enviroment variables **
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

## 13-EC2-IMPORT
- **Usage:** terraform [global options] import [options] ADDR ID
- Import existing infrastructure into your Terraform state.
- This will find and import the specified resource into your Terraform state, allowing existing infrastructure to come under Terraform
- management without having to be initially created by Terraform. The ADDR specified is the address to import the resource to. Please
- see the documentation online for resource addresses. The ID is a resource-specific ID to identify that resource being imported. Please
- reference the documentation for the resource type you're importing to determine the ID syntax to use. It typically matches directly to the ID
- that the provider uses. This command will not modify your infrastructure, but it will make network requests to inspect parts of your infrastructure relevant to
- the resource being imported.
- make sure to add provider block
- 1. Manually create the EC2 resource in AWS and start the EC2.
- 2. Run the instance in AWS. Note the `instance id` to manually map the manually created instance in terraform.
- 3. Create the resource block for the ec2 instance created. Add the `ami` and `instance_type` value.
- ** I am keeping this code as simple as possible without adding any variable(input/output) + workspaces. This is just to understand how import works.**

- **CMDS:**
- $env:AWS_ACCESS_KEY_ID = ""
- $env:AWS_SECRET_ACCESS_KEY = ""
- $env:AWS_REGION = ""
- terraform init
- terraform import aws_instance.aws_linux i-0ffdb09858b34f4bc
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve

## 14-VPC-tc
- Refer `OUTPUT SCREENSHOTS` -> `1.Terraform Login Output`
- This tutorial will give you a brief overview of terraform cloud. How to create account and proceed further.
- Refer SCREENSHOTS`

## 15-modules_1_tc
- Understand `14-VPC-tc` and apply the same process here. Then only this project will execute.
- Need to have a provider block. Specify region only.
- `Access key (AWS_ACCESS_KEY_ID)` and `Secret access key (AWS_SECRET_ACCESS_KEY)` should be specified in terraform cloud.
- **CMD:**
- terraform init -reconfigure
- terraform apply -auto-approve
- terraform destroy -auto-approve

- A workspace name has to be all lower case letters, numbers, and dashes. 
- The recommended naming convention from HashiCorp is the team name, the cloud the infrastructure will be deployed in,
- the application or purpose of the infrastructure, and the environment, whether it's dev, staging, prod, etc. 
- Workspace names are relative to the organization, so they do not have to be globally unique, only unique within the organization.

- We will create 2 workspaces: `devops-aws-myapp-dev`, `devops-aws-myapp-prod`
- For each of the workspaces -> add terraform variables -> `aws_region`, `vpc_name`, `environment`
- `dev` -> `aws_region = us-east-1`, `vpc_name = dev_vpc`, `environment = dev`
- `prod` -> `aws_region = us-east-1`, `vpc_name = prod_vpc`, `environment = prod`

- Since we have Terraform Cloud workspaces that share the same Terraform codebase we will leverage backend partial configuration to select the correct workspace. 
- If you are unfamilar with Terraform backend partial configuration it is recommended you reveiew the Terraform Backend Configuration lab which explains it in detail.
- Create two new files in our working directory called dev.hcl and prod.hcl
- `dev.hcl` -> `workspaces { name="devops-aws-myapp-dev"}`
- `prod.hcl` -> `workspaces { name="devops-aws-myapp-prod"}`

- **CMD:**
- terraform init -backend-config=dev.hcl -reconfigure
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve

- **CMD:**
- terraform init -backend-config=prod.hcl -reconfigure
- terraform plan
- terraform apply -auto-approve
- terraform destroy -auto-approve

- **What belongs in a workspace?**
- Often times we are asked - What should I put in a workspace? We recommend infrastructure that should be managed together as a unit be placed into the same workspace. 
- Who has to manage it, how often does it change, does it have external dependencies that we can't control.
- Ask these questions. Think about what happens when you run terraform apply. 
- You should be able to describe what you just built, and what outputs it provides, who this infrastructure is for, and how to utilize it.
- A workspace could be: An entire application stack from network on up. Great for dev environments that you want to be completely self-contained. 
- Or it could be a workspace that builds core network infrastructure and nothing else. Maybe the network team has to manage that.
- They get to be the lords of the network and provide terraform outputs to those who need a VPC or subnet. You can also use workspaces to deploy platform services like Kubernetes.


























