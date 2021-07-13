data "digitalocean_domain" "domain-phpsouthafrica-org" {
  name = var.dns_domain_phpsouthafrica_org
}

# Add an A record to the domain for www.example.com.
resource "digitalocean_record" "A-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  type = "A"
  name = "@"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A-www-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "www"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A-web01-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "web01"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A-traefik-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "traefik"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "A-star-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "*"
  type = "A"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv4_address
}

resource "digitalocean_record" "AAAA-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "@"
  type = "AAAA"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv6_address
}

resource "digitalocean_record" "AAAA-www-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "www"
  type = "AAAA"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv6_address
}

resource "digitalocean_record" "AAAA-web01-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "web01"
  type = "AAAA"
  value = digitalocean_droplet.web.ipv6_address
}

resource "digitalocean_record" "AAAA-star-dns-domain-phpsouthafrica-org" {
  domain = data.digitalocean_domain.domain-phpsouthafrica-org.name
  name = "*"
  type = "AAAA"
  ttl = var.dns_ttl
  value = digitalocean_droplet.web.ipv6_address
}
