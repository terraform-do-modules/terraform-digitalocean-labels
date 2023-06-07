provider "digitalocean" {
  token = ""
}

##-----------------------------------------------------------------------------
## Labels module callled that will be used for naming and tags.
##-----------------------------------------------------------------------------
module "labels" {
  source      = "./../../"
  name        = "labels"
  environment = "test"
}
