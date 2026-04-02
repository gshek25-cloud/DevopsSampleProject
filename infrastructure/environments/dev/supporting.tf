resource "aws_security_group" "dev_sg" {
  name        = "aish-dev-sg"
  description = "Security group for dev environment"
  vpc_id      = "vpc-01407529d5a2d9a22"

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "dev"
    Project     = "aish"
  }
}

resource "aws_ecr_repository" "app_repo" {
  name = "aish-ecs-app"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
    Name        = "aish-ecs-app"
  }
}

resource "aws_iam_policy" "ecr_access_policy" {
  name        = "aish-dev-ecr-access-policy"
  description = "Allows ECR repository access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ecr:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_ecr_policy_to_user" {
  user       = "Abhishek25"
  policy_arn = aws_iam_policy.ecr_access_policy.arn
}