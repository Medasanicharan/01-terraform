terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
  backend "s3" {
    bucket = "daws78s.xyz-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "daws78s.xyz-locking"
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}