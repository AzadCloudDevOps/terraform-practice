terraform {
required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 4.16"
}
}
        required_version = ">= 1.2.0"
}

provider "aws" {
region = "us-east-1"
}

locals {
        instances = {"Dev":"ami-0b0dcb5067f052a63","Raj":"ami-09a41e26df464c548","Abdul":"ami-0574da719dca65348","Nitin":"ami-08e637cea2f053dfa"}    
}
                                                                                                                                                         
resource "aws_instance" "aws_ec2_test" {
        for_each = local.instances
        ami = each.value
        instance_type = "t2.micro"
        tags = {
     Name = each.key
  }
}
