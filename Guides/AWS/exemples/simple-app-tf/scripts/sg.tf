resource "aws_security_group" "security_group" {
    name = "${local.name}_sg"
    description = "Allow TLS inbound traffic on port 80 (http)"
    vpc_id = data.aws_vpc.selected.id

    ingress {
        from_port = 80
        to_port = "${var.aws_ecs_app_port}"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}