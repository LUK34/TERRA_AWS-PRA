# Remote Backend

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "example-org-1aeabb"

    workspaces {
      name = "devops-tfstate-remote-backend"
    }
  }
}

# S3 Backend
terraform {
  backend "s3" {
    bucket = "my-terraform-state-lrm"
    key    = "prod/aws_infra"
    region = "us-east-1"

    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

# Local Backend
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}