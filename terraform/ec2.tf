resource "aws_instance" "web" {
  ami                    = data.aws_ami.ubuntu.id
  description            = "ami datasource"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.allow_http.id}"]

  tags = {
    Name = "iac-"
  }
}
