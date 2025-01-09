resource "aws_instance" "server" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = ["sg-0f7f3c2d3ce2b40a3"]
  instance_type = "t2.micro"

  tags = {
    Name = "linux"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > private_ips.txt"
  }

  # provisioner "local-exec" {
  #   command = "ansible-playbook -i private_ips.txt web.yaml" 
  # }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install ansible -y",
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_security_group" "allow_everything" {
  name        = "allow_everything_all"
  description = "Allow everything inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   tags = {
    Name = "allow_everything-1"
  }
}