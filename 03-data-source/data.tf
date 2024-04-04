data "aws_ec2_instance_type" "example" {
  instance_type = "t2.micro"
}

output "cost" {
  value = data.aws_ec2_instance_type.example.default_vcpus
}

#
#data "aws_security_groups" "test" {
#  name = "allow-all"
#}
#
#output "sgid" {
#  value = data.aws_security_groups.test.id
#}

data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

output "ami" {
  value = data.aws_ami.example.id
}
provider "aws" {
  region = "us-east-1"
}