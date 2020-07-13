resource "aws_route53_record" "mail-exchange" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "${var.domain_name}"
  type    = "MX"
  ttl     = 86400 # 1 day

  records = [
    "1 ASPMX.L.GOOGLE.COM.",
    "5 ALT1.ASPMX.L.GOOGLE.COM.",
    "5 ALT2.ASPMX.L.GOOGLE.COM.",
    "10 ASPMX2.GOOGLEMAIL.COM.",
    "10 ASPMX3.GOOGLEMAIL.COM.",
  ]
}

resource "aws_route53_record" "calendar" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "calendar.${var.domain_name}"
  type    = "CNAME"
  ttl     = 86400 # 1 day

  records = [
    "ghs.googlehosted.com.",
  ]
}

resource "aws_route53_record" "docs" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "docs.${var.domain_name}"
  type    = "CNAME"
  ttl     = 86400 # 1 day

  records = [
    "ghs.googlehosted.com.",
  ]
}

resource "aws_route53_record" "drive" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "drive.${var.domain_name}"
  type    = "CNAME"
  ttl     = 86400 # 1 day

  records = [
    "ghs.googlehosted.com.",
  ]
}

resource "aws_route53_record" "domain_key" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "google._domainkey.${var.domain_name}"
  type    = "TXT"
  ttl     = 86400 # 1 day

  records = [
    "${var.domain_key}",
  ]
}

resource "aws_route53_record" "mail" {
  zone_id = "${var.aws_route53_zone_id}"
  name    = "mail.${var.domain_name}"
  type    = "CNAME"
  ttl     = 86400 # 1 day

  records = [
    "ghs.googlehosted.com.",
  ]
}
