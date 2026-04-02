output "instance_id" {
  value = aws_instance.sample_app.id
}

output "public_ip" {
  value = aws_instance.sample_app.public_ip
}

output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.ec2_profile.name
}

output "cpu_alarm_name" {
  value = aws_cloudwatch_metric_alarm.high_cpu.alarm_name
}