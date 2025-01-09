resource "aws_instance" "db" {
  ami           = var.image_id
  vpc_security_group_ids = [aws_security_group.allow_everything.id]
  instance_type = var.instance_name == "db" ? "t2.micro" : "t2.small"

  tags = var.tags
}

resource "aws_security_group" "allow_everything" {
  name        = var.sg_name
  description = var.sg_description

  ingress {
    from_port        = var.port
    to_port          = var.port
    protocol         = var.protocol
    cidr_blocks      = var.allowed_cidr
  }

  egress {
    from_port        = var.port
    to_port          = var.port
    protocol         = var.protocol
    cidr_blocks      = var.allowed_cidr
  }

   tags = var.tags1
}