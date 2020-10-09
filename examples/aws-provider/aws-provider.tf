# A baseline setup to use the AWS provider

# This block is not required in TF 12 onwards
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
  alias   = "env"
}

resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
}

# Grabbing the current region
data "aws_region" "current_region" {}

# Passing providers into other modules
module "example_module" {
  source = "./non-existent-folder/non-existent-module"

  region_id = data.aws_region.current_region.id

  providers = {
    aws = aws.env
  }
}
