resource "aws_instance" "terraform" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.terraform_allow_ports.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "terraform_allow_ports" {
  # ... other configuration ...
  name = var.sg_name

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform Allow All Ports"
  }
}