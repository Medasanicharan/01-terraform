resource "aws_instance" "db" {
  count = length(var.instance_names)
  ami           = local.ami_id
  vpc_security_group_ids = [aws_security_group.allow_everything.id]
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t2.micro"

  tags = merge(
    var.common_tags,
    {
    Name = var.instance_names[count.index]
    }
    )
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