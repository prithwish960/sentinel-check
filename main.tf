terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
    region     = "us-east-1"
    access_key = "AKIAUKMG5KE5YHPKRE5F"
    secret_key = "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"
}

resource "aws_instance" "my_instance" {
  ami           = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id]
  tags = {
    Name = "MyServer"
  }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

