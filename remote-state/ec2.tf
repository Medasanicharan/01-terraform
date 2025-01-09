resource "aws_instance" "db" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_everything.id]
  instance_type = "t2.micro"

  tags = {
    Name = "db"
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