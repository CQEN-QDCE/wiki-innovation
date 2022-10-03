#from terraform docs
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api

resource "aws_api_gateway_rest_api" "tpl_api" {
    name = "${local.name}-api-gateway"
    description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_vpc_link" "vpc_link" {
    name = "${local.name}-vpc-link"
    target_arns = [aws_lb.nlb.arn]
}

resource "aws_api_gateway_resource" "tpl_api_resource" {
  parent_id = aws_api_gateway_rest_api.tpl_api.root_resource_id
  path_part   = "${local.name}"
  rest_api_id = aws_api_gateway_rest_api.tpl_api.id
}

resource "aws_api_gateway_method" "tpl_api_method" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.tpl_api_resource.id
  rest_api_id   = aws_api_gateway_rest_api.tpl_api.id
}

resource "aws_api_gateway_integration" "tpl_api_integration" {
  http_method = aws_api_gateway_method.tpl_api_method.http_method
  resource_id = aws_api_gateway_resource.tpl_api_resource.id
  rest_api_id = aws_api_gateway_rest_api.tpl_api.id

  type = "HTTP"
  uri = "http://${aws_lb.nlb.dns_name}"
  integration_http_method = "GET"
  passthrough_behavior    = "WHEN_NO_MATCH"
  content_handling        = "CONVERT_TO_TEXT"

  connection_type = "VPC_LINK"
  connection_id   = aws_api_gateway_vpc_link.vpc_link.id  
}

resource "aws_api_gateway_method_response" "tpl_api_method_response" {
    rest_api_id = aws_api_gateway_rest_api.tpl_api.id
    resource_id = aws_api_gateway_resource.tpl_api_resource.id
    http_method = aws_api_gateway_method.tpl_api_method.http_method
    status_code = "200"

    response_models = {
       "application/json" = "Empty"
    }
}

resource "aws_api_gateway_integration_response" "tpl_api_integration_response" {
    rest_api_id = aws_api_gateway_rest_api.tpl_api.id
    resource_id = aws_api_gateway_resource.tpl_api_resource.id
    http_method = aws_api_gateway_method.tpl_api_method.http_method
    status_code = aws_api_gateway_method_response.tpl_api_method_response.status_code
    
    response_templates = {
      "application/json" = ""
    }
}

resource "aws_api_gateway_deployment" "tpl_api_deployment" {
  rest_api_id = aws_api_gateway_rest_api.tpl_api.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.tpl_api_resource.id,
      aws_api_gateway_method.tpl_api_method.id,
      aws_api_gateway_integration.tpl_api_integration.id
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "tpl_api_stage" {
  deployment_id = aws_api_gateway_deployment.tpl_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.tpl_api.id
  stage_name    = var.aws_environment
  depends_on = [
    aws_api_gateway_deployment.tpl_api_deployment
  ]
}