terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.31"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.23"
    }
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 4.11"
    # }
    # azurerm = {
    #   source  = "hashicorp/azurerm"
    #   version = "~> 3.3"
    # }
  }
  cloud {
    organization = "mjh-demo"

    workspaces {
      tags = ["tfc-admin"]
    }
  }
}

provider "github" {
  token = var.gh_token
  owner = "milesjh"
}

provider "tfe" {
  hostname = var.tfc_hostname
  token    = var.tfc_token
}

# provider "aws" {
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
#   region     = var.aws_region
# }

# provider "azurerm" {
#   features {}
# }