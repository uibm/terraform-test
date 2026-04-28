variable "name" {
  description = "Name to use as trigger for the null resource"
  type        = string
}

resource "null_resource" "demo" {
  triggers = {
    name = var.name
  }
}