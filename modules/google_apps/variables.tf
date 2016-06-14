variable "aws_access_key" {
  type        = "string"
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = "string"
  description = "AWS secret key"
}

variable "aws_region" {
  type        = "string"
  description = "AWS region"
}

variable "aws_route53_zone_id" {
  type        = "string"
  description = "AWS Route 53 Hosted Zone ID"
}

variable "domain_name" {
  type        = "string"
  description = "Canonical domain name of the website"
}

variable "domain_key" {
  type        = "string"
  description = "DKIM issued by Google Apps"
}

variable "environment" {
  type        = "string"
  description = "The environment being used"
}

variable "tenant" {
  type        = "string"
  description = "The tenant of the website"
}
