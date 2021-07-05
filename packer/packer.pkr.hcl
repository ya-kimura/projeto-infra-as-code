source "amazon-ebs" "iac-aws" {
  region        =  "${var.aws_region}"
  source_ami    =  "${var.image_id}"
  instance_type =  "t2.micro"
  ami_name      =  "nodezin_{{timestamp}}"
   
  source_ami_filter {
      filters = {
          name                = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
          virtualization-type = "hvm"
          root-device-type    = "ebs"
      }
      owners      = [ "099720109477" ] # Canonical
      most_recent =  true
  }
  ssh_username  =  "${var.ssh_username}"
}

build {
  sources = ["source.amazon-ebs.iac-aws"]

  provisioner "ansible" {
    ansible_env_vars = ["ANSIBLE_HOST_KEY_CHECKING=False"]
    playbook_file    = "packer/provisioners/ansible/ansible-playbook.yml"
  }
}
