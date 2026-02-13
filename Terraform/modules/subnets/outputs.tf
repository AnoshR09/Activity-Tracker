output "public_subnet_id" {
  value = aws_subnet.PublicSubnet.id
}

output "public_subnet_ids" {
  value = [aws_subnet.PublicSubnet.id, aws_subnet.PublicSubnet2.id]
}

output "private_subnet_id" {
  value = aws_subnet.PrivateSubnet.id
}

output "private_subnet_ids" {
  value = [aws_subnet.PrivateSubnet.id, aws_subnet.PrivateSubnet2.id]
}