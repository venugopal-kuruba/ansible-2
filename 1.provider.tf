provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.9.8"
  required_providers {
    aws = {
      version = "<= 5.75.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "kuruba-ansiblebucket"
    key    = "ansible-kuruba.tfstate"
    region = "us-east-1"
  }
}
