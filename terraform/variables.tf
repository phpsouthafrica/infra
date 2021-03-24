// TODO
// https://www.digitalocean.com/community/tutorials/how-to-use-terraform-within-your-team

# Generate an api key then
# export DIGITALOCEAN_TOKEN='MY_TOKEN'
# export TF_VAR_do_token='MY_TOKEN'

variable "do_token" {}

variable region {
  default = "lon1"
}

variable base_snapshot_name {
  default = "phpsa-ubuntu-20-10-x64-lon1-20210324141529"
}

variable image_id {
  default = "80541591"
}

variable server_size {
  default = "s-1vcpu-1gb"
}

variable "environment" {
  description = "Enviroment"
  default = "production"
}

variable "server_name" {
  default = "web01.phpsouthafrica.co.za"
}
