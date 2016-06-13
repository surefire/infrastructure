provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_iam_account_password_policy" "strict" {
  allow_users_to_change_password = true
  minimum_password_length        = 12
  require_lowercase_characters   = true
  require_uppercase_characters   = true
  require_numbers                = true
  require_symbols                = true
}

resource "aws_iam_role" "external_administrator" {
  name = "ExternalAdministrator"
  path = "/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.aws_external_account_id}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "administrators_policy_attachment" {
  name = "external_administrator_access"

  roles = [
    "${aws_iam_role.external_administrator.name}",
  ]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
