resource "aws_instance" "sample_app" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux (us-east-1)
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3

              cat <<EOT > /home/ec2-user/app.py
              from http.server import BaseHTTPRequestHandler, HTTPServer

              class Handler(BaseHTTPRequestHandler):
                  def do_GET(self):
                      self.send_response(200)
                      self.send_header("Content-type", "text/plain")
                      self.end_headers()
                      self.wfile.write(b"Hello from Aishwarya DevOps EC2!")

              server = HTTPServer(("0.0.0.0", 80), Handler)
              server.serve_forever()
              EOT

              nohup python3 /home/ec2-user/app.py &
              EOF

  tags = {
    Name        = "aish-dev-ec2-app"
    Environment = "dev"
  }
}