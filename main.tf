    terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.26.0"
      
    }
  }
}


provider "aws"  {
      region     = "us-east-1"
      access_key = "AKIAVSZK36ZJIEZMZ6H7"
      secret_key = "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"
    }
provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower=true
  upper=false
  length           = 32
  special          = false
  override_special = ""
}

resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.result

}


output "random_bucket_name" {
  value = random_string.bucket_name.result
}

