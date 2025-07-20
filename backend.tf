terraform {
  backend "s3" {
    bucket         = "kayla0303"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "kay"
  }
}
