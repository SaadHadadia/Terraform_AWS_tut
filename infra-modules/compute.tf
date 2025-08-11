resource "aws_instance" "instances" {
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.instances.name]
  user_data       = <<-EOF
              #!/bin/bash
              echo "Hello, World ${count.index + 1}" > index.html
              python3 -m http.server 8080 &
              EOF
  count           = 2
}