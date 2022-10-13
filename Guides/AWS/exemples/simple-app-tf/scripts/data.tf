data "aws_vpc" "selected" {
    tags = {
      "Name" = "${var.aws_type_compte}_vpc"
    }  
}

data "aws_subnet" "web_subnet_a" {
  tags = {
    "Name" = "Web_${var.aws_type_compte}_aza_net"
  }  
}

data "aws_subnet" "web_subnet_b" {
  tags = {
    "Name" = "Web_${var.aws_type_compte}_azb_net"
  }  
}

data "aws_subnet" "app_subnet_a" {
  tags = {
    "Name" = "App_${var.aws_type_compte}_aza_net"
  }  
}

data "aws_subnet" "app_subnet_b" {
  tags = {
    "Name" = "App_${var.aws_type_compte}_azb_net"
  }  
}

data "aws_security_group" "app_sg" {
  tags = {
    "Name" = "App_sg"
  }  
}

data "aws_security_group" "web_sg" {
  tags = {
    "Name" = "Web_sg"
  }  
}