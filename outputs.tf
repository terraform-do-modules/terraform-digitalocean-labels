#Module      : LABLE
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
output "id" {
  value       = [for labels in digitalocean_tag.id : digitalocean_tag.id]
  description = "Disambiguated ID."
}

output "name" {
  value       = [for labels in digitalocean_tag.name : digitalocean_tag.name]
  description = "Normalized name."
}

output "environment" {
  value       = [for labels in digitalocean_tag.environment : digitalocean_tag.environment]
  description = "Normalized environment."
}

output "managedby" {
  value       = [for labels in digitalocean_tag.managedby : digitalocean_tag.managedby]
  description = "Normalized managedby."
}