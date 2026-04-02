output "dev_ec2_instance_id" {
  value = module.ec2.instance_id
}

output "dev_ec2_public_ip" {
  value = module.ec2.public_ip
}

output "dev_iam_role_name" {
  value = module.ec2.iam_role_name
}

output "dev_instance_profile_name" {
  value = module.ec2.instance_profile_name
}

output "dev_bucket_name" {
  value = module.s3.bucket_name
}
output "dev_cpu_alarm_name" {
  value = module.ec2.cpu_alarm_name
}