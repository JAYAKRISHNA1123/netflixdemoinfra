provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0341d95f75f311023"
instance_type = "t2.medium"
key_name = "swiggykeypair"
vpc_security_group_ids = ["sg-0882bf5acd0062400"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "appserver-1", "appserver-2", "Monitoring server"]
}
