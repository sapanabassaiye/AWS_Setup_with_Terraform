output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_1_id" {
  description = "Public subnet 1 ID"
  value       = aws_subnet.public_subnet_2.id
}

output "public_subnet_2_id" {
  description = "Public subnet 2 ID"
  value       = aws_subnet.public_subnet_2.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "Internet Gateway ID"
  value       = aws_internet_gateway.igw.id
}

output "nat_gateway_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.nat.id
}

output "public_instance_private_ip" {
  description = "Private IP of the public instance"
  value       = aws_instance.public_instance.private_ip
}

output "public_instance_public_ip" {
  description = "Public IP of the public instance"
  value       = aws_eip.public_instance_eip.public_ip  # Using EIP for public instance
}

output "private_instance1_private_ip" {
  description = "Private IP of the private instance 1"
  value       = aws_instance.private_instance_1.private_ip
}

output "private_instance2_private_ip" {
  description = "Private IP of the private instance 2"
  value       = aws_instance.private_instance_2.private_ip
}

output "private_instance3_private_ip" {
  description = "Private IP of the private instance 3"
  value       = aws_instance.private_instance_3.private_ip
}

