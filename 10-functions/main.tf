variable "class" {
  default = "DevOps"
}

output "class" {
  value = upper(var.class)
}

output "class1" {
  value = length(var.class)
}