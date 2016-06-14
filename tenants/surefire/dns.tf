resource "aws_route53_zone" "surefirething_co_uk" {
  name = "surefirething.co.uk"

  tags {
    Tenant      = "SureFire"
    Environment = "${var.environment}"
    Name        = "SureFireThing.co.uk"
  }
}

resource "aws_route53_record" "sender_policy_framework" {
  zone_id = "${aws_route53_zone.surefirething_co_uk.zone_id}"
  name    = "surefirething.co.uk"
  type    = "SPF"
  ttl     = 86400

  records = [
    "v=spf1 include:_spf.google.com include:_spf.freeagent.com ~all",
  ]
}

resource "aws_route53_record" "verification" {
  zone_id = "${aws_route53_zone.surefirething_co_uk.zone_id}"
  name    = "surefirething.co.uk"
  type    = "TXT"
  ttl     = 86400

  records = [
    "freeagent-domain-verification=5iRI6XlXisisgxYNffcp",
    "google-site-verification=2wAnizlgdNX6JUHiHW07wCA5ACjsNNMb_JgseBdyHTk",
  ]
}

resource "aws_route53_record" "email" {
  zone_id = "${aws_route53_zone.surefirething_co_uk.zone_id}"
  name    = "email.surefirething.co.uk"
  type    = "CNAME"
  ttl     = 86400

  records = [
    "cname.createsend.com.",
  ]
}

resource "aws_route53_record" "share" {
  zone_id = "${aws_route53_zone.surefirething_co_uk.zone_id}"
  name    = "share.surefirething.co.uk"
  type    = "CNAME"
  ttl     = 86400

  records = [
    "proxy.heroku.com.",
  ]
}

resource "aws_route53_record" "status" {
  zone_id = "${aws_route53_zone.surefirething_co_uk.zone_id}"
  name    = "status.surefirething.co.uk"
  type    = "CNAME"
  ttl     = 86400

  records = [
    "stats.pingdom.com.",
  ]
}
