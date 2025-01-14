# By using the provider alias meta-argument, you can select an alternate provider configuration for a resource

  provider "aws" {
    region = "eu-north-1"
    }
  
    provider "aws" {
    alias = "usa"
    region = "eu-east-1"
    }
  
    provider "aws" {
    alisa = "mumbai"
    region = "ap-south-1"
    }
  
  # eu-east-1 region configuration for a resource
    resource "aws_instance" "myweb12" {
    provider = alias.usa
    ami             = "ami-0fff1b9a61dec8a5f"
    instance_type   = "t2.micro"
    tags = {
      Name = "HR"
    }
  }
  
  # ap-south-1 region configuration for a resource
    resource "aws_instance" "myweb12" {
     provider = alias.mumbai
    ami             = "ami-0fff1b9a61dec2a4de"
    instance_type   = "t2.micro"
    tags = {
      Name = "DEV"
    }
  }
