output "public_dns" {
  value = aws_route53_record.instance_public_dns_record.name
}

output "private_dns" {
  value = aws_route53_record.instance_private_dns_record.name
}
