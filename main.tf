module "vpc" {
  source = "./modules/vpc"
  route_table_name = "public-rt"
  subnet_name = "public-subnet"
  vpc_name = "ec2-vpc"
  sg_name = "vpc-sg"
  igw_name = "vpc-igw"
  vpc_cidr_block = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"
  ami = "ami-0acc77abdfc7ed5a6"
  subnet_id = module.vpc.public_subnet_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [module.vpc.security_group_id]
  ec2_tag = {
    "name" = "ec2-wordpress"
  }
  user_data = file("${path.module}/wordpress.sh")

}