#output "name" {
#  value = "values"
#}
output "instance-dns" {
  value = aws_instance.jenkins_ubu_instance[*].public_dns
}

output "instance-id" {
  value = aws_instance.jenkins_ubu_instance[*].id
}

output "instance-ip" {
  value = aws_instance.jenkins_ubu_instance[*].public_ip
}

output "security_group_id" {
    value = aws_security_group.lbitc_Jenkins_sg.id
}