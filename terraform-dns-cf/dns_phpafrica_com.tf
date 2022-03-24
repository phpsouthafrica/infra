data "cloudflare_zones" "dns-domain-phpafrica-com" {
  filter {
    name = var.dns_domain_phpafrica_com
  }
}

resource "cloudflare_zone_settings_override" "zone-settings-override-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  settings {
    always_online = "on"
    always_use_https = "on"
    automatic_https_rewrites = "on"
    brotli = "on"
    browser_cache_ttl = 14400
    browser_check = "on"
    cache_level = "aggressive"
    challenge_ttl = 1800
    development_mode = "off"
    email_obfuscation = "on"
    hotlink_protection = "on"
    ip_geolocation = "on"
    ipv6 = "on"
    max_upload = 100
    minify {
      css = "on"
      html = "on"
      js = "on"
    }

    mobile_redirect {
      mobile_subdomain = ""
      status = "off"
      strip_uri = false
    }

    opportunistic_encryption = "on"
    opportunistic_onion = "on"
    privacy_pass = "on"
    pseudo_ipv4 = "off"
    rocket_loader = "on"
    security_header {

      enabled = false
      include_subdomains = false
      max_age = 0
      nosniff = false
      preload = false

    }

    security_level = "medium"
    server_side_exclude = "on"
    ssl = "strict"
    tls_1_3 = "zrt"
    tls_client_auth = "off"
    websockets = "on"
    zero_rtt = "on"
    http3 = "on"
  }
}

resource "cloudflare_record" "MX-aspmx3-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "30"
  value = "aspmx3.googlemail.com"
}
resource "cloudflare_record" "MX-aspmx2-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "30"
  value = "aspmx2.googlemail.com"
}
resource "cloudflare_record" "MX-alt2-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "20"
  value = "alt2.aspmx.l.google.com"
}
resource "cloudflare_record" "MX-alt1-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "20"
  value = "alt1.aspmx.l.google.com"
}
resource "cloudflare_record" "MX-aspmx-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "10"
  value = "aspmx.l.google.com"
}

// TXT
resource "cloudflare_record" "TXT-dmarc-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "_dmarc"
  type = "TXT"
  ttl = var.dns_mx_ttl
  proxied = "false"
  value = "v=DMARC1; p=quarantine; pct=100; sp=none"
}

resource "cloudflare_record" "A-dev-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "dev"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = "127.0.0.1"
}

resource "cloudflare_record" "A-star-dev-dns-domain-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "*.dev"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = "127.0.0.1"
}

resource "cloudflare_record" "TXT-dns-domain-spf1-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "v=spf1 ip4:165.73.55.36 include:_spf.google.com ~all"
}

resource "cloudflare_record" "TXT-dns-domain-dkim1-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = "google._domainkey"
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAiw01IbmFbdYcHqNKOSAh2hJJoWPImPMNXAVyhaDReZWASbCbTfAEePCJcCAePXSolsbKkgoimd+gr2WLaBuh0Qup2B4PYpzumaxR6U4Oi5vo5gVQBVmXvUwGiODAfd/ZcRakjT2WmUcqYDXbyA6bNQw/K+BGv9VoSRPdVZJxxupUPQfvNgmR83LInMRzcYXb1nEWO4gMMRmU5MBz5AdS37D+1vXq604Taldpk3NuHnNDcIO67FdSGy1CUqUkBVTjwsN8/d0o7L+sdLNrV+b7Knv2SJUBlEmmyx46T4iM6+aXkjUr3TQZeg+QC/TwLJFTKNoDKm0DxCw+cFVpYziDYQIDAQAB"
}

resource "cloudflare_record" "TXT-dns-domain-google-site-verification-phpafrica-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpafrica-com.zones[0], "id")
  name = ""
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "google-site-verification=kd_aioKIdLRqDGqKcBfCctPpI6ZOTZ_KNPVLhgRKb3E"
}
