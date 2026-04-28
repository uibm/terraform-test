terraform {
  backend "local" {
    workspace_dir = "../states"
  }
}

module "demo_resource" {
  source = "../modules/demo-resource"
  name   = terraform.workspace
}

output "resource_id" {
  description = "ID of the demo resource"
  value       = module.demo_resource.id
}

output "workspace_name" {
  description = "Current workspace name"
  value       = terraform.workspace
}