locals {
  public_ip  = var.instance.public_ip
  private_ip = var.instance.private_ip
}

resource "aws_route53_record" "instance_public_dns_record" {
  # checkov:skip=CKV2_AWS_23:This is inside a module and responsibility lies with the end user
  count   = var.public ? 1 : 0
  zone_id = var.public_zone
  name    = var.domain_name
  type    = "A"
  ttl     = "300"
  records = [local.public_ip]
}


resource "aws_route53_record" "instance_private_dns_record" {
  # checkov:skip=CKV2_AWS_23:This is inside a module and responsibility lies with the end user
  zone_id = var.private_zone
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [local.private_ip]
}

resource "aws_route53_record" "reverse_dns_record" {

  zone_id = var.reverse_zone

  name = format(
    "%s.in-addr.arpa",
    join(".", reverse(split(".", local.private_ip)))
  )

  type    = "PTR"
  ttl     = 300
  records = [var.domain_name]
}
