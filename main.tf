provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "Environment" = var.environment
      "Repository"  = var.repository_name
      "ManagedBy"   = "Terraform"
      "Creator"     = "Firemind"
    }
  }
}

provider "aws" {
  alias  = "north_virginia"
  region = "us-east-1"
}

terraform {
  backend "s3" {
  }
}
