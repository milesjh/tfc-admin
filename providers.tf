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
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "~> 0.2"
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
    organization = "milesjh-sandbox"

    workspaces {
      tags = ["tfc-admin"]
    }
  }
}

provider "tfe" {}

provider "github" {}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/milesjh-sandbox/"
}

# provider "aws" {
#   access_key = var.aws_access_key
#   secret_key = var.aws_secret_key
#   region     = var.aws_region
# }

# provider "azurerm" {
#   features {}
# }