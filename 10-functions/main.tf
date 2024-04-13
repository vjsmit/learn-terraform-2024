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

output "aws_duration" {
  value = lookup(lookup(var.classes, "aws",null), "duration", "yet to decide")
}

output "devops_duration" {
  value = lookup(lookup(var.classes, "aws",null), "duration", null)
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
  value = lookup(lookup(var.classes, "aws", null), "topics", null)
}

output "fruit_count0" {
  value = var.fruits[0]
}

output "fruit_count2" {
  value = var.fruits[2]
}

#output "fruit_count4" {
#  value = var.fruits[4]
#}

output "fruits_count4" {
  value = element(var.fruits, 4)
}
