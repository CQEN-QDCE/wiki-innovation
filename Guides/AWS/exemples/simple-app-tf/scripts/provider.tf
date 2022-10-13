provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
  default_tags {
    tags = {
      system = var.xxx_system
      environment = var.xxx_environment
    }
  }
}