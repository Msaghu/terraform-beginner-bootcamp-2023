terraform {
  cloud {
    organization = "msaghu"

    workspaces {
      name = "terra-house-renaissance"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}