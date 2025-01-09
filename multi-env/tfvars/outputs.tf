output "instance_public_ip" {
  value = aws_instance.expense
}

output "ami_id" {
    value = data.aws_ami.ami_id
}
