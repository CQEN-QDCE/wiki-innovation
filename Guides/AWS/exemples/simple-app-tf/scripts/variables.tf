variable "aws_region" {
  type = string
  description = "The AWS region where resources are created."
  default = "ca-central-1"
}
variable "aws_application" {
  type = string
  description = "The application's name."
  sensitive = false
}

variable "aws_profile" {
  type        = string
  description = "The profile for the AWS client."
  sensitive   = false  
}

variable "aws_environment" {
  type = string
  description = "The deployment environment (dev, prod). Default = \"dev\"."
  sensitive = false
  default = "dev"
}

variable "aws_type_compte" {
  type        = string
  description = "The deployment environment (dev, prod). Default = \"dev\"."
  sensitive   = false
  default     = "Dev"
}

variable "aws_ecs_ec2_tg_port" {
  type = number
  description = "Port of the target group to expose on the service ecs"
  sensitive = false
}

variable "aws_ecs_app_port" {
  type        = number
  description = "Port of the container to expose on the EC2 instance"
  sensitive   = false
}

variable "aws_ecs_cpu" {
  type        = number
  description = "Number of cpu units used by the task."
  sensitive   = false
}

variable "aws_ecs_memory" {
  type        = number
  description = "Amount (in MiB) of memory used by the task."
  sensitive   = false
}

variable "aws_ecs_health_check_path" {
  type = string
  description = "Destination for the health check request."
  sensitive = false
}

# ecs
variable "aws_ecs_force_deploy" {
  type = bool
  description = "Enable to force a new task deployment of the service. "
  sensitive = false
}

variable "aws_ecs_image_app_tag" {
  type        = string
  description = "Tag of the image to deploy."
  sensitive   = false
  default     = "latest"
}

variable "aws_route53_zone_id" {
  type        = string
  description = ""
  sensitive   = true
}