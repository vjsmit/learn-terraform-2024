#Declaring variables
variable "sample" {
  default = 100
}

variable "sample1" {
  default = "Hello world"
}

## Accessing above variables
output "sample" {
  value = var.sample
}

output "sample1" {
  value = var.sample1
}

output "sample-ext" {
  value = "value of sample - ${var.sample}"
}

##Plain
variable "course" {
  default = "DevOps"
}

##List

variable "course_list" {
  default = [
    "devops",
    "aws",
    "python",
  ]
}

variable "course_details" {
  default = {
    devops = {
      name = "devops"
      duration = 30
      timing = "10am"
    }
    aws = {
      name = "aws"
      duration = 45
      timing = "12 pm"
    }
  }
}

output "course" {
  value = var.course
}

output "course_list" {
  value = var.course_list[2]
}

output "course_details" {
  value = var.course_details["devops"]
}

output "cousre_det" {
  value = var.course_details["aws"]
}

variable "env" {}

output "environment" {
  value = var.env
}