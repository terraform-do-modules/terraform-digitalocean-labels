#Module      : locals
#Description : This terraform module is designed to generate consistent label names and tags
#for resources. You can use terraform-labels to implement a strict naming convention.
locals {
  label_order_defaults = {
    label_order = ["name", "environment"]
  }

  enabled = var.enabled == true ? true : false
  id_context = {
    name        = var.name
    environment = var.environment
  }

  label_order = length(var.label_order) > 0 ? var.label_order : local.label_order_defaults.label_order
  # run loop for label order and set in value.
  id_labels = [for l in var.label_order : local.id_context[l] if length(local.id_context[l]) > 0]

  id          = lower(join(var.delimiter, local.id_labels, var.attributes))
  name        = local.enabled == true ? lower(format("%v%s", "Name:-", var.name)) : ""
  environment = local.enabled == true ? lower(format("%v%s", "Environment:-", var.environment)) : ""
  managedby   = local.enabled == true ? lower(format("%v%s", "Managedby:-", var.managedby)) : ""
  attributes  = local.enabled == true ? lower(format("%v", join(var.delimiter, compact(var.attributes)))) : ""
  delimiter   = local.enabled == true ? lower(format("%v%s", "delimiter:-", var.delimiter)) : ""

  tags_context = {
    # For digitalocean we need `Name` to be disambiguated sine it has a special meaning
    name        = local.id
    environment = local.environment
    managedby   = local.managedby
  }
  generated_tags = { for l in keys(local.tags_context) : title(l) => local.tags_context[l] if length(local.tags_context[l]) > 0 }

  tags = merge(local.generated_tags, var.extra_tags)

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