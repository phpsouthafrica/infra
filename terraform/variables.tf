# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {}

variable region {
  default = "lon1"
}

variable image_name {
  default = "ubuntu-20-10-x64"
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
  default = "web"
}
