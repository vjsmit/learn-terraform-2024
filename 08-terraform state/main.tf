terraform {
  backend "s3" {
    bucket = "terraform-smit"
    key    = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

output "demo" {
  value = "Hello world"
}