variable "vpc_cidr" {
  type = string
  description = "cidr for dev"
  default =  "10.0.0.0/16"
}
variable "env" {
    type = string
    default = "dev"
}
variable "public_subnet_1_cidr" {
    type = string
    default = "10.0.1.0/24"
  
}
variable "private_subnet_1_cidr" {
  type = string
  default = "10.0.11.0/24"

  
}
variable "route_cidr" {
  type = string
  default = "0.0.0.0/0"
  
}