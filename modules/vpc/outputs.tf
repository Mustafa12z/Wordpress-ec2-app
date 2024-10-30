output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
}

output "security_group_id" {
  value = aws_security_group.aws_sg.id
}
