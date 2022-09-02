resource "aws_ecs_task_definition" "app_task" {
    family = "${local.name}-app-task"

    // Fargate is a type of ECS that requires awsvpc network_mode
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"

    // Valid sizes are shown here: https://aws.amazon.com/fargate/pricing/
    memory = var.aws_ecs_memory #"512"
    cpu = var.aws_ecs_cpu #"256"

    // Fargate requires task definitions to have an execution role ARN to support ECR images
    execution_role_arn = aws_iam_role.ecs_task_execution_role.arn #"${aws_iam_role.ecs_task_execution_role.arn}" #"${aws_iam_role.ecs_role.arn}"
    task_role_arn = aws_iam_role.ecs_task_execution_role.arn

    container_definitions = templatefile("tasks/web_api_sample1_task_definition.json", {
        container_name = "${local.name}-container",
        image = "${aws_ecr_repository.ecr_repo.repository_url}:${var.aws_ecs_image_app_tag}",
        container_port = "${var.aws_ecs_app_port}",
        host_port = "${var.aws_ecs_app_port}"
    })
}

#ecs
resource "aws_ecs_cluster" "ecs" {
    name = "${local.name}-ecs"
}

resource "aws_ecs_service" "app_service" {
    name = "${local.name}-app-service"

    cluster = "${aws_ecs_cluster.ecs.id}"
    task_definition = "${aws_ecs_task_definition.app_task.arn}"

    launch_type = "FARGATE"
    desired_count = 1
    depends_on = [
      aws_alb_target_group.alb_tg_http
    ]
    force_new_deployment = var.aws_ecs_force_deploy

    network_configuration {
        subnets = [data.aws_subnet.app_subnet_a.id, data.aws_subnet.app_subnet_b.id]
        security_groups = [aws_security_group.security_group.id, data.aws_security_group.app_sg.id, data.aws_security_group.web_sg.id]
        assign_public_ip = true
    }    
    load_balancer {
      target_group_arn = aws_alb_target_group.alb_tg_http.arn
      container_name = "${local.name}-container"
      container_port = var.aws_ecs_app_port
    }
}