variable "aws_external_account_id" {
  description = "AWS account id for external access"
  type        = "string"
}

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
