provider "aws" {
  region = "ap-south-1"  
}

resource "aws_instance" "example_ec2_instance" {
  ami           = "ami-0f5ee92e2d63afc18"  
  instance_type = "t2.micro"               

  key_name      = "demo1"     
  vpc_security_group_ids = ["sg-00dfff0a4d1ad7bb2"]  

  tags = {
    Name = "ExampleEC2Instance"  
  }
}
