resource "aws_instance" "terraform" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terraform_allow_ports.id]

  tags = {
    Name = "Terraform"
  }
}

resource "aws_security_group" "terraform_allow_ports" {
  # ... other configuration ...
  name = "terraform-allow-ports"

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