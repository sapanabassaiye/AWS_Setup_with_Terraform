variable "aws_region" {
  description = "AWS deployment region"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for public subnet 1"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for public subnet 2"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "availability_zone_1" {
  description = "Availability zone for subnets"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for subnets"
  type        = string
}

variable "project_tag" {
  description = "Project tag for resources"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "synergia_ip" {
  description = "Company's external IP for SSH access"
  type        = string
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "alb_name" {
  description = "Name of the ALB"
  type        = string
}

variable "waf_name" {
  description = "Name of the ALB"
  type        = string
}

# EC2 Configuration

variable "public_instance_name" {
  description = "Name of the public PUB EC2 instance"
  type        = string
}

variable "pub_ami_id" {
  description = "AMI ID for PUB EC2 instance"
  type        = string
}

variable "pub_instance_type" {
  description = "PUB EC2 instance type"
  type        = string
}

variable "pub_ebs_size" {
  description = "PUB EBS volume size in GB"
  type        = number
}

variable "pub_ebs_type" {
  description = "PUB EBS volume type (e.g., gp3)"
  type        = string
}

variable "private_instance_name_1" {
  description = "Name of the private EC2 instance 1"
  type        = string
}

variable "pvt_ami_id_1" {
  description = "AMI ID for PVT EC2 instance 1"
  type        = string
}

variable "pvt_instance_type_1" {
  description = "PVT EC2 instance 1 type"
  type        = string
}

variable "pvt_ebs_size_1" {
  description = "PVT EBS volume 1 size in GB"
  type        = number
}

variable "pvt_ebs_type_1" {
  description = "PVT EBS volume 1 type (e.g., gp3)"
  type        = string
}

variable "user_data_script" {
  description = "Path to the user data file"
  type        = string
}

variable "private_instance_name_2" {
  description = "Name of the private EC2 instance 2"
  type        = string
}

variable "pvt_ami_id_2" {
  description = "AMI ID for PVT EC2 instance 2"
  type        = string
}

variable "pvt_instance_type_2" {
  description = "PVT EC2 instance 2 type"
  type        = string
}

variable "pvt_ebs_size_2" {
  description = "PVT EBS volume 2 size in GB"
  type        = number
}

variable "pvt_ebs_type_2" {
  description = "PVT EBS volume 2 type (e.g., gp3)"
  type        = string
}

variable "private_instance_name_3" {
  description = "Name of the private EC2 instance 3"
  type        = string
}

variable "pvt_ami_id_3" {
  description = "AMI ID for PVT EC2 instance 3"
  type        = string
}

variable "pvt_instance_type_3" {
  description = "PVT EC2 instance 3 type"
  type        = string
}

variable "pvt_ebs_size_3" {
  description = "PVT EBS volume 3 size in GB"
  type        = number
}

variable "pvt_ebs_type_3" {
  description = "PVT EBS volume type 3 (e.g., gp3)"
  type        = string
}

