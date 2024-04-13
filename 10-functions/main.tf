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