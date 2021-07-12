data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "name"
    values = "nodezin_*"
  }

  owners = ["self"] # my user
 #owners = ["872388664293"] my user ami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]
 
  tags = {
    Name = "iac-"
  }
}

