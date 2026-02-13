variable "ami_id" {
    type = string
    default = "ami-00ca32bbc84273381"
}

variable "env" {
    default = "qa"  
}

variable "instance_type" {
    type = string
   default = "t3.micro"
}

variable "instances" {
    default = [ "mangodb", "redis", "catalogue" ]
}

variable "sg_name" {
    type = string
    default = "terrafrom-allow-all"
    description = "Security Group Name to attach to EC2 instance"
}

variable "cidr" {
    type = list 
    default = ["0.0.0.0/0"]
}

variable "ingress_from_port" {
    type = number
    default = 0
}

variable "ingress_to_port" {
    type = number
    default = 0
}

variable "egress_from_port" {
    type = number
    default = 0
}

variable "egress_to_port" {
    type = number
    default = 0
}

variable "egress_protocol"{
    type = string
    default = "-1"
}

variable "ingress_protocol" {
    type = string
    default = "-1"
}