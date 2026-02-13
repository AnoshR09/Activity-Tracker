#Step 2: Creation of Subnet
#public subnet
resource "aws_subnet" "PublicSubnet" {
    vpc_id = var.vpc_id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = true

}
#private subnet
resource "aws_subnet" "PrivateSubnet" {
    vpc_id = var.vpc_id
    cidr_block = "10.0.2.0/24"
}

#Step 3: Creation of InternetGateway
resource "aws_internet_gateway" "igw"{
    vpc_id = var.vpc_id
}

#Step 4: Creation of Route Table
#public route table

resource "aws_route_table" "PublicRouteTable" {
    vpc_id = var.vpc_id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
}
#Step 5: Association of Subnet with Route Table
resource "aws_route_table_association" "PublicSubnetAssociation" {
    subnet_id = aws_subnet.PublicSubnet.id
    route_table_id = aws_route_table.PublicRouteTable.id
}