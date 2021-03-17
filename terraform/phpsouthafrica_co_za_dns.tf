resource "digitalocean_domain" "dns-phpsouthafrica-co-za" {
  name = var.dns_domain_phpsouthafrica_co_za
}

resource "digitalocean_record" "MX-aspmx3-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "30"
  value = "aspmx3.googlemail.com."
}

resource "digitalocean_record" "MX-aspmx2-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "30"
  value = "aspmx2.googlemail.com."
}
resource "digitalocean_record" "MX-alt2-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "20"
  value = "alt2.aspmx.l.google.com."
}
resource "digitalocean_record" "MX-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "20"
  value = "alt1.aspmx.l.google.com."
}
resource "digitalocean_record" "MX-aspmx-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name     = "@"
  type = "MX"
  ttl = var.dns_mx_ttl
  priority = "10"
  value = "aspmx.l.google.com."
}

//// TXT
//resource "digitalocean_record" "TXT-dmarc-dns-phpsouthafrica-co-za" {
//  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
//  name = "_dmarc"
//  type = "TXT"
//  ttl = var.dns_mx_ttl
//  value = "v=DMARC1; p=quarantine; pct=100; sp=none"
//}
//
//resource "digitalocean_record" "TXT-dns-phpsouthafrica-co-za_spf1" {
//  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
//  name     = "@"
//  type = "TXT"
//  ttl = var.dns_mx_ttl
//  value = "v=spf1 ip4:196.50.196.145 include:_spf.google.com ~all"
//}
//
//resource "digitalocean_record" "TXT-dns-phpsouthafrica-co-za-google-site-verification" {
//  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
//  name     = "@"
//  type = "TXT"
//  ttl = var.dns_site_verification_ttl
//  value = "google-site-verification=qx_RLH8nXhczOxbmh8CCGihjqzaUq-tyWNBUsb8B84I"
//}

resource "digitalocean_record" "A-test-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "test"
  type = "A"
  ttl = var.dns_ttl
  value = "127.0.0.1"
}

resource "digitalocean_record" "A-dev-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "dev"
  type = "A"
  ttl = var.dns_ttl
  value = "127.0.0.1"
}

resource "digitalocean_record" "A-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "@"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A-www-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "www"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "AAAA-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "@"
  type = "AAAA"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv6_address
}

resource "digitalocean_record" "AAAA-www-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  name = "www"
  type = "AAAA"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv6_address
}

data "digitalocean_records" "NS-dns-phpsouthafrica-co-za" {
  domain = digitalocean_domain.dns-phpsouthafrica-co-za.name
  filter {
    key = "type"
    values = ["NS"]
  }
}
