data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["IaaS-${var.hash_commit}"] 
  }

  owners = ["self"] # my user
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = "subnet-"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]
 
  tags = {
    Name = "HelloWorld"
  }
}

