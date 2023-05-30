provider "digitalocean" {
  # You need to set this in your .bashrc
  # export DIGITALOCEAN_TOKEN="Your API TOKEN"
  #
}

module "labels" {
  source      = "./../"
  name        = "labels"
  environment = "test"
  label_order = ["name", "environment"]
  attributes  = ["private"]
  extra_tags = {
    Application = "CloudDrove"
  }
}
