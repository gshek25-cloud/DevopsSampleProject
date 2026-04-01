resource "aws_instance" "sample_app" {
  ami                    = "ami-0c02fb55956c7d316"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-0b84057f32a74cf22"
  vpc_security_group_ids = ["sg-0aef17d781d1ca0ea"]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Hello from Aish Dev EC2</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name        = "aish-dev-ec2-app"
    Environment = "dev"
  }
}