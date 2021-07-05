provider "aws"{
  region = "us-east-2"   
  version = "~> 3.0"
}

terraform {
  backend "s3" {
    bucket = "infra-as-code2"
    key    = "terraform-test.tfstate"
    region = "us-east-2"
  }
}
