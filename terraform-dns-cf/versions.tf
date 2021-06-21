terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "~> 2.21"
    }
  }

  required_version = "~> 1.0"
}

