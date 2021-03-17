output "NS-servers-dns-phpsouthafrica-co-za" {
  value = join(",", data.digitalocean_records.NS-dns-phpsouthafrica-co-za.records[*].value)
}

output "NS-servers-dns-phpsouthafrica-org" {
  value = join(",", data.digitalocean_records.NS-dns-phpsouthafrica-org.records[*].value)
}
