# --- root/main.tf ---

locals {
  vpc_cidr = "10.123.0"
}

module "networking" {
  source           = "./networking"
  vpc_cidr         = "10.123.0.0/16"
  public_sn_count  = 2
  private_sn_count = 3
  max_subnets      = 20
  public_cidrs     = [for i in range(2, 225, 2) : cidrsubnet("10.123.0.0/16", 8, i)] #["10.123.2.0/24", "10.123.4.0/24" ]
  private_cidrs    = [for i in range(1, 225, 2) : cidrsubnet("10.123.0.0/16", 8, i)] #["10.123.1.0/24", "10.123.3.0/24", "10.123.5.0/24"]
}