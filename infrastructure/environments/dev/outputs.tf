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
  value = aws_security_group.dev_sg.cd id
}