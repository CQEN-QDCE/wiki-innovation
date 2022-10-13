resource "aws_acm_certificate" "api_domain_cert" {
  domain_name       = "${local.name}.ceai.cqen.ca"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# Create DNS record using Route53.
resource "aws_route53_record" "api_domain_route53_record" {
  name    = aws_api_gateway_domain_name.api_domain.domain_name
  type    = "A"
  zone_id = var.aws_route53_zone_id
  alias {
    evaluate_target_health = true
    name                   = aws_api_gateway_domain_name.api_domain.regional_domain_name
    zone_id                = aws_api_gateway_domain_name.api_domain.regional_zone_id
  }
}