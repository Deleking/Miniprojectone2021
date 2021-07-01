terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

data "template_file" "ec2_user_data" {
    template ="$file("${path.module}/bootstrap.txt")}"

resource "aws_instance" "Tool Server 1" {
  ami            = "var.instance_ami"
  instance_type  = var.instance_type
  key_name       = var.ssh_key
  user_data      = data.template_file.ec2_user_data.template
  vpc_security_group_ids =


  tags = {
    Name = "Tool Server 1"
  }
}
