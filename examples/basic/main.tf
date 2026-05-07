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