variable "region" {
  description = "Value for region"
  type        = string
}

variable "vpc_name" {
  description = "Value for the name tag of vpc"
  type        = string
}

variable "vpc_cider_block" {
  description = "Value for cider block of vpc"
  type        = string
}

variable "private_subnet_cider_blocks" {
  description = "Value as a list of lists containing strings for cider blocks of private subnet"
  type        = list(list(string))
}

variable "public_subnet_cider_blocks" {
  description = "Value as a list of lists containing strings for cider blocks of public subnet"
  type        = list(list(string))
}

variable "availability_zones" {
  description = "Value as a list of strings for availability zones"
  type        = list(string)
}

variable "internet_gateway_name" {
  description = "Value for name tag of internet gateway"
  type        = string
}

variable "public_route_table_name" {
  description = "Value for name tag of public route table"
  type        = string
}

variable "private_route_table_name" {
  description = "Value for name tag of private route table"
  type        = string
}