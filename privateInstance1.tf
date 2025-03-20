# Private EC2 Instance 1

resource "aws_instance" "private_instance_1" {
  ami                    = var.pvt_ami_id_1
  instance_type          = var.pvt_instance_type_1
  subnet_id              = aws_subnet.private.id
  security_groups        = [aws_security_group.private_sg_1.id]
  key_name               = var.key_name
  associate_public_ip_address = false  # No auto public IP
  
  user_data = file(var.user_data_path)

  root_block_device {
    volume_size = var.pvt_ebs_size_1
    volume_type = var.pvt_ebs_type_1
    encrypted   = true
  }

  tags = {
    Name    = var.private_instance_name_1
    Project = var.project_tag
  }
}

# Security Group for Private Subnet Instance
resource "aws_security_group" "private_sg_1" {
  name        = "${var.sg_name}-private1"
  description = "Security Group for Private Subnet Instance"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name    = "${var.sg_name}-private1"
    Project = var.project_tag
  }
}

# Allow SSH from Public Subnet Instance to Private Subnet Instance
resource "aws_security_group_rule" "ssh_from_public_to_private1" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_sg_1.id  # Private instance
  source_security_group_id = aws_security_group.public_sg.id   # Public instance
  description              = "${var.public_instance_name}"
}

# Allow Inbound traffic from ALB SG 
resource "aws_security_group_rule" "Inbound_traffic_from_asg" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_sg_1.id # Private instance
  source_security_group_id = aws_security_group.alb_sg.id   # Public instance
  description              = "ALB SG"
}

# Allow outbound HTTP (80)
resource "aws_security_group_rule" "http_outbound1" {
  type        = "egress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_group_id = aws_security_group.private_sg_1.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}

# Allow outbound HTTPS (443)
resource "aws_security_group_rule" "https_outbound1" {
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.private_sg_1.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}
