# Create a new SSH key
resource "digitalocean_ssh_key" "tim-ssh" {
  name       = "Tim SSH Key"
  public_key = file("../ansible-base-setup/roles/ssh_users/files/ssh_keys/timhaak@macbook.pub")
}

resource "digitalocean_droplet" "web" {
  name = var.server_name
  size = var.server_size
  image = var.image_name
  region = var.region
  ipv6 = true
  ssh_keys = [
    digitalocean_ssh_key.tim-ssh.id
  ]
}
