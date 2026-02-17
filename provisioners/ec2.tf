resource "aws_instance" "terraform" {
  ami           = "ami-00ca32bbc84273381"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.terraform_allow_ports.id]

  tags = {
    Name = "Terraform"
    Terraform = "true"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"   
    on_failure = continue
  }

  provisioner "local-exec" {
    command = "echo Instance is Destroyed"
    when = destroy
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = "${self.public_ip}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
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