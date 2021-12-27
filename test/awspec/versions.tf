terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws    = ">= 3.19"
    random = ">= 3.1"
  }
}

provider "aws" {
  region = "us-east-1"
}