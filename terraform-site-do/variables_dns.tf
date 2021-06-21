variable "dns_domains" {
  type    = list(string)
  description = "Domains for php meetup"
  default = [
    "phpza.com",
    "phpafrica.com"
  ]
}

variable "dns_domain_phpza_com" {
  description = "phpza_com Domains for php meetup"
  default = "phpza.com"
}

variable "dns_domain_phpafrica_com" {
  description = "phpafrica.com Domains for php meetup"
  default = "phpafrica.com"
}

variable "dns_mx_ttl" {
  default = "900"
}

variable "dns_ttl" {
  default = "60"
}

variable "dns_site_verification_ttl" {
  default = "60"
}
