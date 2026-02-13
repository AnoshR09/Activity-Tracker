output "vpc_id" {
  value = aws_vpc.vpc1.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc1.cidr_block
}