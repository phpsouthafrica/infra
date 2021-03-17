variable "dns_domains" {
  type    = list(string)
  description = "Domains for php meetup"
  default = [
    "phpsouthafrica.org",
    "phpsouthafrica.co.za"
  ]
}

variable "dns_domain_phpsouthafrica_co_za" {
  description = "phpsouthafrica_co_za Domains for php meetup"
  default = "phpsouthafrica.co.za"
}

variable "dns_domain_phpsouthafrica_org" {
  description = "phpsouthafrica.org Domains for php meetup"
  default = "phpsouthafrica.org"
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
