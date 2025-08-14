# output "instance_id" {
#   value = aws_instance.ankit.id
# }
# output "public_ip" {
#   value = aws_instance.ankit.public_ip
# }
# output "dns" {
#   value = aws_instance.ankit.public_dns
# }
# output "private_ip" {
#   value = aws_instance.ankit.private_ip
# }
output "instance_id" {
  value = [for key in aws_instance.ankit : key.id]
}
output "public_ip" {
  value = [for key in aws_instance.ankit : key.public_ip]
}
output "dns" {
  value = [for key in aws_instance.ankit : key.public_dns]
}
output "private_ip" {
  value = [for key in aws_instance.ankit : key.private_ip]
}