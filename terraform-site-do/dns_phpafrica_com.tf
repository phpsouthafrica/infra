data "cloudflare_zones" "dns-domain-phpafrica-com" {
  filter {
    name = var.dns_domain_phpafrica_com
  }
}

resource "cloudflare_record" "A-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "A"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-www-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "www"
  type = "A"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-web01-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "web01"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "AAAA-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "AAAA"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv6_address
}

resource "cloudflare_record" "AAAA-www-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "www"
  type = "AAAA"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv6_address
}

resource "cloudflare_record" "AAAA-web01-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "web01"
  type = "AAAA"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv6_address
}
