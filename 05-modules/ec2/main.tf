resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.sample.id]

  tags = {
    Name = "HelloWorld"
  }
}

data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

resource "aws_security_group" "sample" {
  name        = "sample"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "sample"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.sample.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}


resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sample.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
