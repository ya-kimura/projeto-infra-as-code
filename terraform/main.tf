provider "aws"{
  region = "us-east-2"   
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "pipe-drone"
    key    = "terraform-test.tfstate"
    region = "us-east-2"
  }
}