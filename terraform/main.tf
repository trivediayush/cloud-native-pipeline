provider "aws" {
    region     = "eu-north-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_instance" "web" {
    ami           = ""
    instance_type = "t2.micro"

    tags = {
        Name = "DemoWebInstance"
    }
}