provider "aws" {
  alias      = "main"
  access_key = var.aws_access_key.main
  secret_key = var.aws_secret_key.main
  region     = var.aws_region
}

resource "aws_iam_user" "andrewgarner" {
  provider = aws.main
  name     = "andrewgarner"
  path     = "/users/"
}

resource "aws_iam_group" "main_administrators" {
  provider = aws.main
  name     = "Administrators"
  path     = "/users/"
}

resource "aws_iam_group_membership" "main_administrators" {
  provider = aws.main
  name     = "AdministratorsGroupMembership"

  users = [
    aws_iam_user.andrewgarner.name,
  ]

  group = aws_iam_group.main_administrators.name
}

resource "aws_iam_policy_attachment" "main_administrators_administrator_access" {
  provider = aws.main
  name     = "AdministratorsAdministratorAccess"

  groups = [
    aws_iam_group.main_administrators.name,
  ]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_s3_bucket" "terraform_logs" {
  provider = aws.main
  bucket   = "surefire.operations.terraform.logs"
  acl      = "log-delivery-write"

  lifecycle_rule {
    id      = "Rule for the Entire Bucket"
    prefix  = ""
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  tags = {
    Tenant      = "SureFire"
    Environment = "Operations"
    Name        = "Terraform"
  }
}

resource "aws_s3_bucket" "terraform" {
  provider = aws.main
  bucket   = "surefire.operations.terraform"
  acl      = "private"

  lifecycle_rule {
    id      = "Rule for the Entire Bucket"
    prefix  = ""
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  logging {
    target_bucket = aws_s3_bucket.terraform_logs.id
  }

  tags = {
    Tenant      = "SureFire"
    Environment = "Operations"
    Name        = "Terraform"
  }

  versioning {
    enabled = true
  }
}
