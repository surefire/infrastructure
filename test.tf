module "test_identity_and_access" {
  source                  = "./identity_and_access"
  aws_access_key          = var.aws_access_key.test
  aws_secret_key          = var.aws_secret_key.test
  aws_region              = var.aws_region
  aws_external_account_id = var.aws_account_id.main
}
