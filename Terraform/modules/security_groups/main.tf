#Step 6: Creation of Security Group
resource "aws_security_group" "mySG"{
    name = "allow_traffic"
    description = "Allow inbound traffic on port 22 and 80"
    vpc_id = var.vpc_id

    tags = {
        Name = "allow_traffic_sg"
    }
}
#allow inbound rules for SSH and HTTP
resource "aws_security_group_rule" "allow_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr]
    security_group_id = aws_security_group.mySG.id
}
resource "aws_security_group_rule" "allow_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [var.vpc_cidr]
    security_group_id = aws_security_group.mySG.id
}
#allow all outbound traffic  
resource "aws_security_group_rule" "allow_all_outbound" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.mySG.id  
}
resource "aws_security_group_rule" "allow_nodeport" {
    type = "ingress"
    from_port = 30000
    to_port = 32767
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.mySG.id
}

