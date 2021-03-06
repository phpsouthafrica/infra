terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.9"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.21"
    }
  }

  required_version = "~> 1.0"
}

