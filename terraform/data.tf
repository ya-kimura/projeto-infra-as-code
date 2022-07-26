data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["nodezin_*"]
  }

  owners = ["self"] # my user
}

data "aws_vpc" "default" {
  default = tru
}
