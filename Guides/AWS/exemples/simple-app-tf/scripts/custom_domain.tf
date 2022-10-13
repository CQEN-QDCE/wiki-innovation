resource "aws_api_gateway_domain_name" "api_domain" {
 domain_name              = aws_acm_certificate.api_domain_cert.domain_name
 regional_certificate_arn = aws_acm_certificate.api_domain_cert.arn
 security_policy          = "TLS_1_2"
  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

resource "aws_api_gateway_base_path_mapping" "api_mapping" {
  api_id      = aws_api_gateway_rest_api.tpl_api.id
  stage_name  = aws_api_gateway_stage.tpl_api_stage.stage_name
  domain_name = aws_api_gateway_domain_name.api_domain.domain_name
  depends_on = [
    aws_api_gateway_domain_name.api_domain,
    aws_acm_certificate.api_domain_cert
  ]
}