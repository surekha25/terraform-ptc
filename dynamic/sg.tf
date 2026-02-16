resource "aws_security_group" "terraform_allow_ports" {
  # ... other configuration ...
  name = "terraform-allow-ports"

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

# --- block---

  dynamic ingress {
    for_each = toset(var.ingress_port) 
    content{
      from_port        = ingress.value #-- here ingress is special variable
      to_port          = ingress.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
    }  
  }

  tags = {
    Name = "Terraform Allow All Ports"
  }
}