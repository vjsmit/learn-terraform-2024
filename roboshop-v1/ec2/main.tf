resource "aws_instance" "web" {
  ami           = data.aws_ami.example.id
  instance_type = "t3.small"
  vpc_security_group_ids = [aws_security_group.sample.id]

  tags = {
    Name = var.name
  }

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = self.public_ip
    }

    inline = [
      "sudo labauto ansible ",
      "ansible-pull -i localhost, -U https://github.com/vjsmit/roboshop-ansible-1 roboshop.yml -e env=dev -e role_name=${var.name}",
    ]
  }
}

data "aws_ami" "example" {
  owners = ["973714476881"]
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
}

resource "aws_route53_record" "www" {
  zone_id = "Z0478111B3O54DLF4LSS"
  name    = "${var.name}-dev"
  type    = "A"
  ttl     = 30
  records = [aws_instance.web.private_ip]
}

resource "aws_security_group" "sample" {
  name        = var.name
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  security_group_id = aws_security_group.sample.id
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sample.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

variable "name" {}