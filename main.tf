provider "aws" {
  alias      = "main"
  access_key = "${var.aws_access_key.main}"
  secret_key = "${var.aws_secret_key.main}"
  region     = "${var.aws_region}"
}

resource "aws_iam_user" "andrewgarner" {
  provider = "aws.main"
  name     = "andrewgarner"
  path     = "/users/"
}

resource "aws_iam_group" "main_administrators" {
  provider = "aws.main"
  name     = "Administrators"
  path     = "/users/"
}

resource "aws_iam_group_membership" "main_administrators" {
  provider = "aws.main"
  name     = "AdministratorsGroupMembership"

  users = [
    "${aws_iam_user.andrewgarner.name}",
  ]

  group = "${aws_iam_group.main_administrators.name}"
}

resource "aws_iam_policy_attachment" "main_administrators_administrator_access" {
  provider = "aws.main"
  name     = "AdministratorsAdministratorAccess"

  groups = [
    "${aws_iam_group.main_administrators.name}",
  ]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
