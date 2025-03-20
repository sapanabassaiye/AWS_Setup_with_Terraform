# Private EC2 Instance 2

resource "aws_instance" "private_instance_2" {
  ami                    = var.pvt_ami_id_2
  instance_type          = var.pvt_instance_type_2
  subnet_id              = aws_subnet.private.id
  security_groups        = [aws_security_group.private_sg_2.id]
  key_name               = var.key_name
  associate_public_ip_address = false  # No auto public IP

  root_block_device {
    volume_size = var.pvt_ebs_size_2
    volume_type = var.pvt_ebs_type_2
    encrypted   = true
  }

  tags = {
    Name    = var.private_instance_name_2
    Project = var.project_tag
  }
}

# Security Group for Private Subnet Instance
resource "aws_security_group" "private_sg_2" {
  name        = "${var.sg_name}-private2"
  description = "Security Group for Private Subnet Instance"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name    = "${var.sg_name}-private2"
    Project = var.project_tag
  }
}

# Allow SSH from Public Subnet Instance to Private Subnet Instance
resource "aws_security_group_rule" "ssh_from_public_to_private2" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.private_sg_2.id  # Private instance
  source_security_group_id = aws_security_group.public_sg.id   # Public instance
  description              = "${var.public_instance_name}"
}

# Allow outbound HTTP (80)
resource "aws_security_group_rule" "http_outbound2" {
  type        = "egress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  security_group_id = aws_security_group.private_sg_2.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}

# Allow outbound HTTPS (443)
resource "aws_security_group_rule" "https_outbound2" {
  type        = "egress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  security_group_id = aws_security_group.private_sg_2.id
  cidr_blocks = ["0.0.0.0/0"]  # Allow to any destination (internet)
}
