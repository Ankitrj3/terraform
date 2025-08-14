output "instance_id" {
  value = aws_instance.ankit.id
}
output "public_ip" {
  value = aws_instance.ankit.public_ip
}
output "dns" {
  value = aws_instance.ankit.public_dns
}
output "private_ip" {
  value = aws_instance.ankit.private_ip
}