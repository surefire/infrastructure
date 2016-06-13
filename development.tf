module "development_identity_and_access" {
  source                  = "./identity_and_access"
  aws_access_key          = "${var.aws_access_key.development}"
  aws_secret_key          = "${var.aws_secret_key.development}"
  aws_region              = "${var.aws_region}"
  aws_external_account_id = "${var.aws_account_id.main}"
}
