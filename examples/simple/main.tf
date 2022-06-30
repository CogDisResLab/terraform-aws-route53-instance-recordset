resource "aws_route53_zone" "public" {
  name = "example.com"
}

resource "aws_route53_zone" "private" {
  name = "example.com"

  vpc {
    vpc_id = aws_vpc.example.id
  }
}

module "recordset" {
  source  = "CogDisResLab/route53-recordset/aws"
  version = "0.1.0"

  instance     = aws_instance.example
  private_zone = aws_route53_zone.private.id
  reverse_zone = aws_route53_zone.public.id
  domain_name  = "www.example.com"
}
