variable "aws_region" {
  description = "AWS region"
  type        = "string"
  default     = "eu-west-1"
}

variable "aws_account_id" {
  description = "AWS account ids indexed by environment"
  type        = "map"

  default = {
    main        = ""
    development = ""
  }
}

variable "aws_access_key" {
  description = "AWS access keys indexed by environment"
  type        = "map"

  default = {
    main        = ""
    development = ""
  }
}

variable "aws_secret_key" {
  description = "AWS secret keys indexed by environment"
  type        = "map"

  default = {
    main        = ""
    development = ""
  }
}
