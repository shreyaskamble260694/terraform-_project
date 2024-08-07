# Define the SSH key pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
}

# Output the key name
output "printfilename" {
  value = aws_key_pair.deployer.key_name
}

# Define the security group with dynamic ingress rules
resource "aws_security_group" "web_sg" {
  name_prefix = "web_sg_"
  description = "Security group for web instances"

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "web" {
  ami           = var.aws_ami
  instance_type = var.aws_instance_type
  key_name      = aws_key_pair.deployer.key_name

  tags = {
    Name = "shreyas_terraform_create"
  }
}
