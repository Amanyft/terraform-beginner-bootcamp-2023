terraform {

  cloud {
    organization = "MyTerraformBootcamp_byAndrewBrown"
    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
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

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  lower = true
  upper = false
  length   = 32
  special  = false
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  # Bucket Naming Rules
  #https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html?icmpid=docs_amazons3_console
  bucket = random_string.bucket_name.result
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
