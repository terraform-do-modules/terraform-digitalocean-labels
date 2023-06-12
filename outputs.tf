#Module      : LABLE
#Description : This terraform module is designed to generate consistent label names and tags
#              for resources. You can use terraform-labels to implement a strict naming
#              convention.
output "id" {
  value       = digitalocean_tag.id[0].id
  description = "Disambiguated ID."
}

output "name" {
  value       = digitalocean_tag.name[0].name
  description = "Normalized name."
}

output "environment" {
  value       = digitalocean_tag.environment[0].name
  description = "Normalized environment."
}

output "managedby" {
  value       = digitalocean_tag.environment[0].name
  description = "Normalized managedby."
}