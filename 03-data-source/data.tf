data "aws_ec2_instance_type" "example" {
  instance_type = "t2.micro"
}

output "cost" {
  value = data.aws_ec2_instance_type.example.default_vcpus
}


data "aws_security_groups" "test" {
  name = "allow-all"
  availability_zone = "us-east-1a"
}

output "sgid" {
  value = data.aws_security_groups.test.id
}