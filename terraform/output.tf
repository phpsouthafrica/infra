output "NS-servers-dns-phpsouthafrica-co-za" {
  value = join(",", data.digitalocean_records.NS-dns-phpsouthafrica-co-za.records[*].value)
}

output "NS-servers-dns-phpsouthafrica-org" {
  value = join(",", data.digitalocean_records.NS-dns-phpsouthafrica-org.records[*].value)
}

output "web01-ipv4" {
  value = digitalocean_droplet.web.ipv4_address
}

output "web01-ipv6" {
  value = digitalocean_droplet.web.ipv6_address
}
