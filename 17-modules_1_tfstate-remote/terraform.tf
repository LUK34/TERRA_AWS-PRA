terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "example-org-1aeabb"

    workspaces {
      name = "devops-tfstate-remote-backend"
    }
  }
}
