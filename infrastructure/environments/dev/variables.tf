variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
}
variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}