resource "digitalocean_domain" "dns-phpsouthafrica-org" {
  name = var.dns_domain_phpsouthafrica_org
}

resource "digitalocean_record" "MX-aspmx3-dns-phpsouthafrica-org" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "10"
  value = "spool.mail.gandi.net."
}

resource "digitalocean_record" "MX-aspmx2-dns-phpsouthafrica-org" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "50"
  value = "fb.mail.gandi.net."
}
//resource "digitalocean_record" "MX-alt2-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name     = "@"
//  type = "MX"
//  ttl = var.dns_mx_ttl
//  priority = "20"
//  value = "alt2.aspmx.l.google.com."
//}
//resource "digitalocean_record" "MX-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name     = "@"
//  type = "MX"
//  ttl = var.dns_mx_ttl
//  priority = "20"
//  value = "alt1.aspmx.l.google.com."
//}
//resource "digitalocean_record" "MX-aspmx-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name     = "@"
//  type = "MX"
//  ttl = var.dns_mx_ttl
//  priority = "10"
//  value = "aspmx.l.google.com."
//}

//// TXT
//resource "digitalocean_record" "TXT-dmarc-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name = "_dmarc"
//  type = "TXT"
//  ttl = var.dns_mx_ttl
//  value = "v=DMARC1; p=quarantine; pct=100; sp=none"
//}
//
resource "digitalocean_record" "TXT-dns-phpsouthafrica-org_spf1" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name     = "@"
  type = "TXT"
  ttl = var.dns_mx_ttl
  value = "v=spf1 include:_mailcust.gandi.net ?all"
}
//
//resource "digitalocean_record" "TXT-dns-phpsouthafrica-org-google-site-verification" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name     = "@"
//  type = "TXT"
//  ttl = var.dns_site_verification_ttl
//  value = "google-site-verification=qx_RLH8nXhczOxbmh8CCGihjqzaUq-tyWNBUsb8B84I"
//}

resource "digitalocean_record" "A-test-dns-phpsouthafrica-org" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "test"
  type = "A"
  ttl = var.dns_ttl
  value = "127.0.0.1"
}

resource "digitalocean_record" "A-dev-dns-phpsouthafrica-org" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "dev"
  type = "A"
  ttl = var.dns_ttl
  value = "127.0.0.1"
}

//resource "digitalocean_record" "A-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name = "@"
//  type = "A"
//  ttl = var.dns_ttl
//  value = "185.199.108.153"
//}
//
//resource "digitalocean_record" "A-www-dns-phpsouthafrica-org" {
//  domain = digitalocean_domain.dns-phpsouthafrica-org.name
//  name = "www"
//  type = "A"
//  ttl = var.dns_ttl
//  value = "185.199.108.153"
//}

data "digitalocean_records" "NS-dns-phpsouthafrica-org" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  filter {
    key = "type"
    values = ["NS"]
  }
}

resource "digitalocean_record" "CNAME-dns-phpsouthafrica-org-em6965" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "em6965"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  value = "u22398277.wl028.sendgrid.net."
}

resource "digitalocean_record" "CNAME-dns-phpsouthafrica-org-s1-domainkey" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "s1._domainkey"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  value = "s1.domainkey.u22398277.wl028.sendgrid.net."
}

resource "digitalocean_record" "CNAME-dns-phpsouthafrica-org-s2-domainkey" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "s2._domainkey"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  value = "s2.domainkey.u22398277.wl028.sendgrid.net."
}

resource "digitalocean_record" "CNAME-dns-phpsouthafrica-org-url7137" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "url7137"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  value = "sendgrid.net."
}


resource "digitalocean_record" "CNAME-dns-phpsouthafrica-org-22398277" {
  domain = digitalocean_domain.dns-phpsouthafrica-org.name
  name = "22398277"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  value = "sendgrid.net."
}
