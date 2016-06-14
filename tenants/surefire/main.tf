provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

module "google_apps" {
  source              = "../../modules/google_apps"
  tenant              = "SureFire"
  environment         = "${var.environment}"
  domain_name         = "surefirething.co.uk"
  domain_key          = "v=DKIM1; k=rsa; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDloYlaau3wfwxMWnFFFEOm4WEBglyPM0keScIA96jwn8JRNuPnIMlElfrfJoLa0/U3AK0Pmhypwdn+ndcM6u0EKZqMKmZkYXYRMhdSg/TM2n8Z2AXV618ZAIaOd3gs2JHgt3pyD3juD0aiEdJ/00oFHp5ZJ+ZoU5GCVu4o4jvoRQIDAQAB"
  aws_access_key      = "${var.aws_access_key}"
  aws_secret_key      = "${var.aws_secret_key}"
  aws_region          = "${var.aws_region}"
  aws_route53_zone_id = "${aws_route53_zone.surefirething_co_uk.id}"
}
