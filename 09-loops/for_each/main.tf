resource "aws_instance" "web" {
  for_each      = var.instances
  ami           = data.aws_ami.example.id
  instance_type = each.key["instance_type"]

  tags = {
    Name = each.key
  }
}
data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

variable "instances" {
  default = {

    frontend = {
      name = "frontend"
      instance_type = "t2.micro"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.nano"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.nano"
    }
  }
}
