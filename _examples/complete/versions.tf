# Terraform version
terraform {
  required_providers {
    required_version = ">= 1.4.6"
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}