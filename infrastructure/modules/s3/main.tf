resource "aws_s3_bucket" "this" {
 bucket = "${var.project_name}-${var.environment}-bucket-${var.bucket_suffix}"

  tags = {
    Name        = "${var.project_name}-${var.environment}-bucket"
    Environment = var.environment
  }
}