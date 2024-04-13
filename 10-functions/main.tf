variable "class" {
  default = "DevOps"
}

output "class" {
  value = upper(var.class)
}

output "class1" {
  value = length(var.class)
}

variable "fruits" {
  default = [ "apple", "banana", "Guava" ]
}

output "fruits_count" {
  value = length(var.fruits)
}

variable "classes" {
  default = {
    devops = {
      name = "devops"
      duration = 90
      topics = [ "jenkins", "docker" ]
    }
    aws = {
      name = "aws"
    }
  }
}

output "devops_topics" {
  value = var.classes["devops"]["topics"]
}

#output "aws_topics" {
#  value = var.classes["aws"]["topics"]
#}

output "aws_name" {
  value = lookup(var.classes, "aws", null)
}

output "aws_topics" {
  value = lookup(lookup(var.classes, "aws", null), "topics", "no topics so far")
}