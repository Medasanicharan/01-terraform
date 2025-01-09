resource "aws_instance" "expense" {
  # count = 3
  # count = length(var.instance_names)
  for_each = var.instance_names
  ami           = data.aws_ami.ami_id.id
  vpc_security_group_ids = [aws_security_group.allow_everything.id]
  instance_type = each.value

  tags = merge(
  var.common_tags,
  {
   Name = each.key
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