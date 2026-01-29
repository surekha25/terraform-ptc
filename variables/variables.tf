variable "ami_id" {
    type = string
    default = "ami-00ca32bbc84273381"
}

variable "instance_type" {
    type = string
   default = "t3.micro"
}

variable "ec2_tags" {
    type = map
    default = {        
        Name = "terraform-demo"
        Terraform = "true"
        Project = "joindevops"
        Environment = "dev"
    } 
}

variable "sg_name" {
    type = string
    default = "terrafrom-allow-all"
    description = "Security Group Name to attach to EC2 instance"
}