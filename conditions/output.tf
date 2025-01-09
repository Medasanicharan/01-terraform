output "instance_public_ip" {
  value = aws_instance.db.public_ip
}

output "instance_private_ip" {
  value = aws_instance.db.private_ip
}