# ---networking/output.tf---

output "vpc_id" {
  value = "aws_vpc.toba_vpc.id"
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.toba_rds_subnetgroup.*.name

}

output "db_security_group" {
  value = [aws_security_group.toba_sg["rds"].id]

}
output "public_sg" {
  value = aws_security_group.toba_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.toba_public_subnet.*.id
}