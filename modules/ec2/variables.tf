variable "ami" {
  description = "The AMI ID to use for the instance"
  type = string
}

variable "instance_type" {
  description = "The type of instance to create"
  type  = string
}

variable "user_data" {
  description = "The user script for the machine to run on command"
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type = string
}

variable "vpc_security_group_ids" {
  description = "calling the security groups"
  type = list(string)
}

variable "ec2_tag" {
  description = "ec2 tags"
  type = map(string)
}