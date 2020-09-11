resource "aws_instance" "webapp" {
  ami 		= lookup(var.ami_id, var.region)
  instance_type = "t2.micro"
  key_name 	= "class02webapp" 

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags = {
    Name = "MyApplication01"
  } 
}

