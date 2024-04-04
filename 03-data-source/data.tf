data "aws_ec2_instance_type" "example" {
  instance_type = "t2.micro"
}

output "cost" {
  value = data.aws_ec2_instance_type.example.default_vcpus
}


data "aws_security_groups" "test" {
  id = "allow-all"
}

output "sgid" {
  value = data.aws_security_groups.test.id
}