resource "aws_iam_role" "ec2_role" {
  name = "aish-dev-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Environment = "dev"
    Project     = "DevOpsSampleProject"
  }
}