# --- root/variables.tf ---
variable "aws_region" {
  default = "eu-west-3"
}

variable "access_ip" {
  type = string
}

# --- datatbase variables ---

variable "db_name" {
  type = string
}

variable "db_user" {
  type      = string
  sensitive = true

}
variable "db_password" {
  type      = string
  sensitive = true

}