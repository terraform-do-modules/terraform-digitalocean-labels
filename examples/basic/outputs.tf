# ------------------------------------------------------------------------------
# Outputs
# ------------------------------------------------------------------------------
output "id" {
  value       = module.labels.id
  description = "Disambiguated ID (e.g. app-test)."
}

output "name" {
  value       = module.labels.name
  description = "Normalized name tag value."
}

output "environment" {
  value       = module.labels.environment
  description = "Normalized environment tag value."
}
