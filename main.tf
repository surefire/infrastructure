provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_iam_group" "administrators" {
  name = "administrators"
  path = "/users/"
}

resource "aws_iam_policy_attachment" "administrators_policy_attachment" {
  name = "administrators_administrator_access"

  groups = [
    "${aws_iam_group.administrators.name}",
  ]

  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user" "andrewgarner" {
  name = "andrewgarner"
  path = "/users/"
}

resource "aws_iam_group_membership" "administrators" {
  name = "administrators_group_membership"

  users = [
    "${aws_iam_user.andrewgarner.name}",
  ]

  group = "${aws_iam_group.administrators.name}"
}
