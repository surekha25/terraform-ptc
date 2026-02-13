data "aws_instance" "mangodb"{
    instance_id = "i-0bc78ded3dabe17b3"
}

output "mongodb-info" {
    value = data.aws_instance.mangodb.public_ip
}