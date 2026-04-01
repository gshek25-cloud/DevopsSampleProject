output "bucket_name" {
  value = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  value = module.s3_bucket.bucket_arn
}
output "iam_role_name" {
  value = aws_iam_role.ec2_role.name
}

output "security_group_id" {
  value = aws_security_group.dev_sg.id
}

output "ec2_public_ip" {
  value = aws_instance.sample_app.public_ip
}

output "ec2_url" {
  value = "http://${aws_instance.sample_app.public_ip}"
}