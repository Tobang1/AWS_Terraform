# --- root/main.tf ---



module "networking" {
  source           = "./networking"
  vpc_cidr         = local.vpc_cidr
  access_ip        = var.access_ip
  security_groups  = local.security_groups
  public_sn_count  = 2
  private_sn_count = 3
  max_subnets      = 20
  public_cidrs     = [for i in range(2, 225, 2) : cidrsubnet(local.vpc_cidr, 8, i)] #["10.123.2.0/24", "10.123.4.0/24" ]
  private_cidrs    = [for i in range(1, 225, 2) : cidrsubnet(local.vpc_cidr, 8, i)] #["10.123.1.0/24", "10.123.3.0/24", "10.123.5.0/24"]
  db_subnet_group  = true
}

# ---module databse---
module "database" {
  source                 = "./database"
  db_storage             = 10
  db_engine_version      = "5.7.22"
  db_instance_class      = "db.t2.micro"
  db_name                = "rancher"
  db_user                = "bobby"
  dbpassword             = "t4b!3s2021"
  db_identifier          = "toba-db"
  skip_db_snapshot       = true
  db_subnet_group_name   = module.networking.db_subnet_group_name[0]
  vpc_security_group_ids = module.networking.db_security_group
}