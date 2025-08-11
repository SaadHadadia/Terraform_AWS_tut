output "instance_1_ip_addr" {
  value = aws_instance.instances[0].public_ip
}

output "instance_2_ip_addr" {
  value = aws_instance.instances[1].public_ip
}

output "db_instance_addr" {
  value = aws_db_instance.db_instance.address
}