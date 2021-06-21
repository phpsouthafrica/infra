data "cloudflare_zones" "dns-domain-phpza-com" {
  filter {
    name = var.dns_domain_phpza_com
  }
}

resource "cloudflare_record" "A-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "A"
//  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-www-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "www"
  type = "A"
//  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-web01-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "web01"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-traefik-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "traefik"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "A-star-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "*"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv4_address
}

resource "cloudflare_record" "AAAA-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "AAAA"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv6_address
}

resource "cloudflare_record" "AAAA-www-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "www"
  type = "AAAA"
//  ttl = var.dns_ttl
  proxied = "true"
  value = digitalocean_droplet.web.ipv6_address
}

resource "cloudflare_record" "AAAA-web01-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "web01"
  type = "AAAA"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv6_address
}

resource "cloudflare_record" "AAAA-star-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "*"
  type = "AAAA"
  ttl = var.dns_ttl
  proxied = "false"
  value = digitalocean_droplet.web.ipv6_address
}
