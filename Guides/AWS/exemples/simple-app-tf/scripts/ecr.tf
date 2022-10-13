locals {
  name = "${var.aws_application}-${var.aws_environment}"
}

resource "aws_ecr_repository" "ecr_repo" {
    name = "${local.name}-ecr"
    image_tag_mutability = "MUTABLE"
}