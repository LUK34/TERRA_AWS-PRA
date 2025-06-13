variable "cloud" {
  type = string

  validation {
    condition     = contains(["aws", "azure", "gcp", "vmware"], lower(var.cloud))
    error_message = "You must use an approved cloud."
  }

  validation {
    condition     = lower(var.cloud) == var.cloud
    error_message = "The cloud name must not have capital letters."
  }
}
# ------------------------------------------------------------------------------------------------
variable "no_caps" {
  type = string

  validation {
    condition     = lower(var.no_caps) == var.no_caps
    error_message = "Value must be in all lower case."
  }

}
# ------------------------------------------------------------------------------------------------
variable "character_limit" {
  type = string

  validation {
    condition     = length(var.character_limit) == 3
    error_message = "This variable must contain only 3 characters."
  }
}
# ------------------------------------------------------------------------------------------------
variable "ip_address" {
  type = string

  validation {
    condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}$", var.ip_address))
    error_message = "Must be an IP address of the form X.X.X.X."
  }
}
# ------------------------------------------------------------------------------------------------

# Suppressing sensitive information

variable "phone_number" {
  type      = string
  sensitive = true
  default   = "867-5309"
}

locals {
  contact_info = {
    cloud        = var.cloud
    department   = var.no_caps
    cost_code    = var.character_limit
    phone_number = var.phone_number
  }

  my_number = nonsensitive(var.phone_number)
}

output "cloud" {
  value = local.contact_info.cloud
}

output "department" {
  value = local.contact_info.department
}

output "cost_code" {
  value = local.contact_info.cost_code
}

output "phone_number" {
  sensitive = true
  value     = local.contact_info.phone_number
}

output "my_number" {
  value = local.my_number
}

# ------------------------------------------------------------------------------------------------

# Collections

variable "us-east-1-azs" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e"
  ]
}

variable "ip" {
  type = map(string)
  default = {
    prod = "10.0.150.0/24"
    dev  = "10.0.250.0/24"
  }
}

variable "env" {
  type = map(any)
  default = {
    prod = {
      ip = "10.0.150.0/24"
      az = "us-east-1a"
    }
    dev = {
      ip = "10.0.250.0/24"
      az = "us-east-1e"
    }
  }
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "environment" {
  type        = string
  description = "Infrastructure environment. eg. dev, prod, etc"
  default     = "test"
}
