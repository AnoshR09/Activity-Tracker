resource "tls_private_key" "ec2_sshkey" {
    algorithm = "RSA"
    rsa_bits  = 4096
  
}
resource "aws_key_pair" "infra_project_key" {
    key_name   = "infra_project_key"  # Replace with your desired key pair name
    public_key = tls_private_key.ec2_sshkey.public_key_openssh
}

resource "local_file" "ssh_private_key" {
    content  = tls_private_key.ec2_sshkey.private_key_pem
    filename = "C:\\Users\\anosh\\Downloads\\infra_project_key.pem"
    file_permission = "0400"
}

resource "aws_instance" "infra-project" {
    ami           = "ami-0fa91bc90632c73c9"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type in eu-north-1
    instance_type = "t3.micro"
    subnet_id     = var.subnet_id
    key_name    = aws_key_pair.infra_project_key.key_name

    tags = {
        Name = var.instance_name
    }
  
    vpc_security_group_ids = [var.security_group_id]
}

resource "aws_instance" "infra-project-second-instance" {
    ami           = "ami-0fa91bc90632c73c9"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type in eu-north-1
    instance_type = "t3.micro"
    subnet_id     = var.subnet_id
    key_name    = aws_key_pair.infra_project_key.key_name

    tags = {
        Name = "Infra-Project-Second-Instance"
    }
  
    vpc_security_group_ids = [var.security_group_id]
    user_data = file("${path.module}/install_docker.sh")
}