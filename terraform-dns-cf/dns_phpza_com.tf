data "cloudflare_zones" "dns-domain-phpza-com" {
  filter {
    name = var.dns_domain_phpza_com
  }
}

resource "cloudflare_zone_settings_override" "zone-settings-override-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
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

resource "cloudflare_record" "MX-aspmx3-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "30"
  value = "aspmx3.googlemail.com"
}
resource "cloudflare_record" "MX-aspmx2-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "30"
  value = "aspmx2.googlemail.com"
}
resource "cloudflare_record" "MX-alt2-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "20"
  value = "alt2.aspmx.l.google.com"
}
resource "cloudflare_record" "MX-alt1-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "20"
  value = "alt1.aspmx.l.google.com"
}
resource "cloudflare_record" "MX-aspmx-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "MX"
  ttl = var.dns_mx_ttl
  proxied = "false"
  priority = "10"
  value = "aspmx.l.google.com"
}

// TXT
resource "cloudflare_record" "TXT-dmarc-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "_dmarc"
  type = "TXT"
  ttl = var.dns_mx_ttl
  proxied = "false"
  value = "v=DMARC1; p=quarantine; pct=100; sp=none"
}

resource "cloudflare_record" "A-dev-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "dev"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = "127.0.0.1"
}

resource "cloudflare_record" "A-star-dev-dns-domain-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "*.dev"
  type = "A"
  ttl = var.dns_ttl
  proxied = "false"
  value = "127.0.0.1"
}

resource "cloudflare_record" "TXT-dns-domain-spf1-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "v=spf1 ip4:165.73.55.36 include:_spf.google.com ~all"
}

resource "cloudflare_record" "TXT-dns-domain-dkim1-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "google._domainkey"
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn12x1ZmYbuuTAAY1jrOLEtxUlMMHdt+MYL/7RPk3NtfGBMbgXwEdLIkQ4dpGGOqce+j1dN4Aw/FAveVnk1koz37C5Y8bTX40xtdgD2sr238rOvNhs06xC3+wxQGmqUIFNHSpybadpbRrhAXwnPRwAfnEtS3IO/mpMGhjd+tv81QjP1ksm8eNnhS2kTgf1wgO9IN4Hb2Tr9N6n+yFhfSp2WEIZb4T4ht3R1LxDXXdKFqUAs34acEa6PewLTCz5MI4n+4UyRL8+W017fFBdNPgE6kSQ1v5Sff//uofskjnCOm5q8uK4wL6H0DaLDzHDPYVr3Pxpwc40u+GUk0imWFfBwIDAQAB"
}

resource "cloudflare_record" "TXT-dns-domain-google-site-verification-phpza-com" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = ""
  type = "TXT"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "google-site-verification=z9RJbX_78sKY01HiX_fITEaijRC5UjYaVJ6MsH4ijCI"
}

resource "cloudflare_record" "CNAME-dns-domain-em2616" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "em2616"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "u22398277.wl028.sendgrid.net"
}

resource "cloudflare_record" "CNAME-dns-domain-s1-domainkey" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "s1._domainkey.phpza.com"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "s1.domainkey.u22398277.wl028.sendgrid.net"
}

resource "cloudflare_record" "CNAME-dns-domain-s2-domainkey" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "s2._domainkey.phpza.com"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "s2.domainkey.u22398277.wl028.sendgrid.net"
}

resource "cloudflare_record" "CNAME-dns-domain-url8013" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "url8013.phpza.com"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "sendgrid.net"
}


resource "cloudflare_record" "CNAME-dns-domain-22398277" {
  zone_id = lookup(data.cloudflare_zones.dns-domain-phpza-com.zones[0], "id")
  name = "22398277.phpza.com"
  type = "CNAME"
  ttl = var.dns_site_verification_ttl
  proxied = "false"
  value = "sendgrid.net"
}
