provider "digitalocean" {}

##------------------------------------------------
## Labels module call — minimal/basic
## Produces a normalized ID and DigitalOcean Tags
## using the default label order (name, environment).
##------------------------------------------------
module "labels" {
  source = "./../../"

  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
}

##------------------------------------------------
## Example: use the labels outputs downstream
## The id output (e.g. "app-test") is the primary
## value used as a resource name prefix.
##------------------------------------------------
output "id" {
  description = "Composed resource identifier, e.g. app-test."
  value       = module.labels.id
}

output "name_tag" {
  description = "Normalized name tag value."
  value       = module.labels.name
}

output "environment_tag" {
  description = "Normalized environment tag value."
  value       = module.labels.environment
}
