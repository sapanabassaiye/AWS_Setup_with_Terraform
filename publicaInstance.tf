# Public EC2 Instance
resource "aws_instance" "public_instance" {
  ami                    = var.pub_ami_id
  instance_type          = var.pub_instance_type
  subnet_id              = aws_subnet.public_subnet_1.id
  security_groups        = [aws_security_group.public_sg.id] 
  key_name               = var.key_name
  associate_public_ip_address = false  # No auto public IP

  root_block_device {
    volume_size = var.pub_ebs_size
    volume_type = var.pub_ebs_type
    encrypted   = true
  }

  tags = {
    Name    = var.public_instance_name
    Project = var.project_tag
  }
}

# Create an Elastic IP
resource "aws_eip" "public_instance_eip" {
  domain = "vpc"

  tags = {
    Name    = "${var.public_instance_name}-eip"
    Project = var.project_tag
  }
}

# Associate Elastic IP with Public EC2 Instance
resource "aws_eip_association" "public_eip_assoc" {
  instance_id   = aws_instance.public_instance.id
  allocation_id = aws_eip.public_instance_eip.id
}


# Security Group for Public Subnet Instance
resource "aws_security_group" "public_sg" {
  name        = "${var.sg_name}-public"
  description = "Security Group for Public Subnet Instance"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name    = "${var.sg_name}-public"
    Project = var.project_tag
  }
}

# Allow SSH from company network (synergia_ip)
resource "aws_security_group_rule" "ssh_from_synergia" {
  type        = "ingress"
  from_port   = 3389
  to_port     = 3389
  protocol    = "tcp"
  security_group_id = aws_security_group.public_sg.id  
  cidr_blocks = [var.synergia_ip]
  description = "Synergia IP"
}

# Allow Outbound traffic to Private_Instance1
resource "aws_security_group_rule" "ssh_outbound_to_private1" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.public_sg.id
  source_security_group_id = aws_security_group.private_sg_1.id  
  description = "${var.private_instance_name_1}"
}

# Allow Outbound traffic to Private_Instance2
resource "aws_security_group_rule" "ssh_outbound_to_private2" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.public_sg.id
  source_security_group_id = aws_security_group.private_sg_2.id  
  description = "${var.private_instance_name_2}" 
}

# Allow Outbound traffic to Private_Instance3
resource "aws_security_group_rule" "ssh_outbound_to_private3" {
  type                     = "egress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.public_sg.id
  source_security_group_id = aws_security_group.private_sg_3.id  
  description = "${var.private_instance_name_3}"
}

# Allow outbound HTTP (80)
resource "aws_security_group_rule" "http_outbound" {
  type        = "egress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_group_id = aws_security_group.public_sg.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}

# Allow outbound HTTPS (443)
resource "aws_security_group_rule" "https_outbound" {
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.public_sg.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}
