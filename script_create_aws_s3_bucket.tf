terraform = {
  required_version = "1.7.5"
  required_providers = {
    aws = {
      source = "hashicorp/aws"
      version = "v3.23.0"
    }
  }

}
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-45609549605"
  acl = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}
