provider "digitalocean" {
  #  token = ""
}

##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "./../../"
  name        = "labels"
  environment = "test"
  label_order = ["name", "environment"]
  attributes  = ["private"]
  extra_tags = {
    Application = "test"
  }
}
