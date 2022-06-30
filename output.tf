output "public_dns" {
  value       = aws_route53_record.instance_public_dns_record.name
  description = "The public DNS name for the instance"
}

output "private_dns" {
  value       = aws_route53_record.instance_private_dns_record.name
  description = "The private DNS name for the instance"
}
