
variable "do_api_token" {
  type      = string
  default   = "${env("DIGITALOCEAN_TOKEN")}"
  sensitive = true
}

variable "image_name" {
  type    = string
  default = "ubuntu-20-10-x64"
}

variable "region_name" {
  type    = string
  default = "lon1"
}

variable "size" {
  type    = string
  default = "s-1vcpu-1gb"
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "digitalocean" "autogenerated_1" {
  api_token     = "${var.do_api_token}"
  image         = "${var.image_name}"
  region        = "${var.region_name}"
  size          = "${var.size}"
  snapshot_name = "phpsa-${var.image_name}-${var.region_name}-${local.timestamp}"
  ssh_username  = "root"
}

build {
  sources = ["source.digitalocean.autogenerated_1"]

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["update-locale LANG=en_US.UTF-8", "DEBIAN_FRONTEND=noninteractive apt-get update", "DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y", "DEBIAN_FRONTEND=noninteractive apt-get autoremove -y", "DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common apt-transport-https", "DEBIAN_FRONTEND=noninteractive apt-get install -y python3-pip python3 python3-apt ansible", "DEBIAN_FRONTEND=noninteractive apt-get autoremove -y"]
    inline_shebang  = "/bin/sh -x"
  }

  provisioner "ansible-local" {
    extra_arguments = ["-e", "'ansible_python_interpreter=/usr/bin/python3'"]
    playbook_dir    = "../ansible-base-setup"
    playbook_file   = "../ansible-base-setup/playbooks/packer.yml"
  }

  provisioner "shell" {
    execute_command   = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    expect_disconnect = true
    scripts           = ["scripts/cgroup-memory.sh"]
  }

  provisioner "shell" {
    execute_command   = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    expect_disconnect = true
    scripts           = ["scripts/cleanup_initial.sh", "scripts/motd.sh"]
  }

  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    scripts         = ["scripts/cleanup.sh"]
  }

}