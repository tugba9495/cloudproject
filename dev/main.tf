############# vpc ############

resource "aws_vpc" "cloud_project" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = replace(local.name, "rtype", "cloud-project-vpc")
    }
}
############# public subnets #########
resource "aws_subnet" "public-subnet1" {
    vpc_id = aws_vpc.cloud_project.id
    cidr_block = var.public_subnet_1_cidr
    availability_zone = "us-west-1a"
    tags = {
      Name = "public-subnet1"
    }
  
}
############# private subnets #########

resource "aws_subnet" "private-subnet1" {
    vpc_id = aws_vpc.cloud_project.id
    cidr_block = var.private_subnet_1_cidr
    availability_zone = "us-west-1a"
    tags = {
      Name = "private-subnet1"
    }
  
}

############### internet gateway ############

resource "aws_internet_gateway" "cloud_project_gw" {
    vpc_id = aws_vpc.cloud_project.id
    tags = {
    Name = "cloud_project_gw"
  }
  
}

###################### PUBLIC ROUTE TABLE ##################
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.cloud_project.id

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.cloud_project_gw.id
  }

  

  tags = {
    Name = replace(local.name, "rtype", "cloudproject_public_route_table")
  }
}
##################### PUBLIC ROUTE TABLE ASSOCIATION ###################
resource "aws_route_table_association" "public_subnet_1" {
  subnet_id      = aws_subnet.public-subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

##################### PRIVATE ROUTE TABLE  ###################
# resource "aws_route_table" "private_route_table" {
#   vpc_id = aws_vpc.cloud_project.id

#   route {
#     cidr_block     = var.route_for_private_route
#     nat_gateway_id = aws_nat_gateway.wordpress_nat_gateway.id
#   }
#   tags = merge(
#     local.common_tags,
#     {
#       Name = "${var.env}_private_rtb"
#     }
#   )
# }