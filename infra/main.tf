provider "aws" {
  region = "us-east-1"
}

# Usando data source para referenciar o key pair existente
data "aws_key_pair" "existing" {
  key_name = "terraform-keypair"
}

resource "aws_security_group" "securitygroup" {
  name        = "sg-http-ssh-${formatdate("DDMMYYYY", timestamp())}"
  description = "Permitir acesso HTTP e SSH"
  vpc_id      = "vpc-05ef7e75b62bb5bec"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Access"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SecurityGroup-ServidorWeb"
  }
}

resource "aws_instance" "servidor" {
  ami      = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"  # Atualizado para micro (nano é muito pequeno)
  vpc_security_group_ids = [aws_security_group.securitygroup.id]
  key_name = data.aws_key_pair.existing.key_name  # Referencia o key pair existente

}

output "public_dns" {
  value = aws_instance.servidor.public_dns
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/terraform-keypair.pem ec2-user@${aws_instance.servidor.public_dns}"
}