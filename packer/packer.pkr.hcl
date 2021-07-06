variable "ami_name" {
  type = string 
  default = "ami-00399ec92321828f5"
}

variable "region" {
  type    = string
  default = "us-east-2"
}

variable "ssh_username" {
  type  = string
  default = "ubuntu"
}

source "amazon-ebs" "iac-aws" {
  region        =  "${var.region}"
  source_ami    =  "${var.ami_name}"
  instance_type =  "t2.micro"
  ami_name      =  "nodezin_{{timestamp}}"
  ssh_username  =  "ubuntu" 

  source_ami_filter {
      filters = {
          name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
          virtualization-type = "hvm"
          root-device-type    = "ebs"
      }
      owners      = [ "099720109477" ] # Canonical
      most_recent =  true
  }
  
}

build {
  sources = ["source.amazon-ebs.iac-aws"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_HOST_KEY_CHECKING=False"]
    playbook_file    = "packer/provisioners/ansible/main.yml"
  }
}

