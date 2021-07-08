variable "region" {
  type    = string
  default = "us-east-2"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}

source "amazon-ebs" "iac-aws" {
  region        = var.region
  instance_type = "t2.micro"
  ssh_username  = var.ssh_username
  ami_name      = "nodezin_{{timestamp}}"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
      virtualization-type = "hvm"
      root-device-type    = "ebs"
    }
    owners      = ["099720109477"] # Canonical
    most_recent = true
  }

}

build {
  sources = ["source.amazon-ebs.iac-aws"]

  provisioner "ansible" {
    use_proxy = false
    ansible_env_vars = ["ANSIBLE_HOST_KEY_CHECKING=False"]
    playbook_file    = "./ansible/main.yml"
    extra_arguments = [
      "--extra-vars",
      "ansible_python_interpreter=/bin/python3"
      
    ]
  }
}

