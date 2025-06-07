terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "example-org-1aeabb"

    workspaces {
      name = "my-aws-app"
    }
  }
}
