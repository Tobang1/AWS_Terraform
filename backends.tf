terraform {
  cloud {
    organization = "toba-terraform"

    workspaces {
      name = "toba-dev"
    }
  }
}