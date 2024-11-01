resource "aws_instance" "this" {
  ami = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = var.vpc_security_group_ids
  user_data = var.user_data
}