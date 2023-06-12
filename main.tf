#Module      : locals
#Description : This terraform module is designed to generate consistent label names and tags
#for resources. You can use terraform-labels to implement a strict naming convention.
locals {
  enabled = var.enabled == true ? true : false
  id_context = {
    name        = var.name
    environment = var.environment
  }

  # run loop for label order and set in value.
  id_labels = [for l in var.label_order : local.id_context[l] if length(local.id_context[l]) > 0]

  id          = lower(join(var.delimiter, local.id_labels, var.attributes))
  name        = local.enabled == true ? format("%v%s", "Name:-", var.name) : ""
  environment = local.enabled == true ? format("%v%s", "Environment:-", var.environment) : ""
  managedby   = local.enabled == true ? format("%v%s", "Managedby:-", var.managedby) : ""
}

##-----------------------------------------------------------------------------
## Below resources will create Tag resource.
##-----------------------------------------------------------------------------
resource "digitalocean_tag" "id" {
  count = var.enabled == true && local.id != "" ? 1 : 0
  name  = local.id
}

resource "digitalocean_tag" "name" {
  count = var.enabled == true && local.name != "" ? 1 : 0
  name  = local.name
}

resource "digitalocean_tag" "environment" {
  count = var.enabled == true && local.environment != "" ? 1 : 0
  name  = local.environment
}

resource "digitalocean_tag" "managedby" {
  count = var.enabled == true && local.managedby != "" ? 1 : 0
  name  = local.managedby
}