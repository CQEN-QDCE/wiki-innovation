aws_region      = "ca-central-1"
aws_profile     = "dev_cqen_aws15"
aws_application = "web-api-sample1"
aws_environment = "dev" 

aws_type_compte = "Dev"
aws_ecs_cpu = 1024
aws_ecs_memory = 2048
aws_ecs_app_port = 3000
aws_ecs_ec2_tg_port = 80

aws_ecs_force_deploy = true
aws_ecs_health_check_path = "/"
aws_ecs_image_app_tag = "latest"
aws_route53_zone_id = "<copiez ici l'identifiant de la zone de la route 53 d'AWS>"