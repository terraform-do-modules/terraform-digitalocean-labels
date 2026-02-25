# Terraform version constraint.
# Also compatible with OpenTofu >= 1.6.0 (https://opentofu.org).
terraform {
  required_version = ">= 1.5.4"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = ">= 2.29.0"
    }
  }
}
