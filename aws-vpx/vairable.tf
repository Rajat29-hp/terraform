variable "vpc_cidr_block"{
  type= string
  description = "CIDR block for VPC"
  default= "10.0.0.0/16"
}
variable "public_vpc_cidr_block"{
  type= string
  description = "CIDR block for VPC"
  default= "10.0.1.0/24"
}
variable "route_table_cidr_block"{
  type= string
  description = "CIDR block for VPC"
  default= "0.0.0.0/0"
}
variable "port-rule"{
  type= list(number)
  default= [22,80]
}
