provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.small"
  key_name = "pankaj-key"

  tags = {
    Name = "pankaj-devops-server-v2"
    env = "production"
    owner = "pankaj"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}

