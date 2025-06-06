provider "aws" {
  region = "us-east-1"
}

# Refer the README.md file vefore executing this code. This is a bit tricky.
resource "aws_instance" "aws_linux" {
  ami           = "ami-02457590d33d576c3"
  instance_type = "t2.micro"

}



