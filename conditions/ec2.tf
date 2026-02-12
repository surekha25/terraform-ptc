resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.env == "dev" ? "t3.micro" : "t3.large"
  vpc_security_group_ids = [aws_security_group.terraform_allow_ports.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "terraform_allow_ports" {
  # ... other configuration ...
  name = var.sg_name

  egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = var.cidr
  }

  ingress {
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = var.ingress_protocol
    cidr_blocks      = var.cidr
  }

  tags = {
    Name = "Terraform Allow All Ports"
  }
}