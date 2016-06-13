provider "aws" {
  alias      = "production"
  access_key = "${var.aws_access_key.production}"
  secret_key = "${var.aws_secret_key.production}"
  region     = "${var.aws_region}"
}

resource "aws_iam_role" "production_external_administrator" {
  provider = "aws.production"
  name     = "ExternalAdministrator"
  path     = "/"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${var.aws_account_id.main}:root"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "production_administrators_policy_attachment" {
  provider = "aws.production"
  name     = "external_administrator_access"

  roles = [
    "${aws_iam_role.production_external_administrator.name}",
  ]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
