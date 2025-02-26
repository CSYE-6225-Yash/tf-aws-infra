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

variable "security_group_name" {
  description = "Value for name tag of security group"
  type        = string
}

variable "security_group_description" {
  description = "Value for description of security group"
  type        = string
}

variable "security_group_ingress_rule" {
  description = "Value for description of security group"
  type        = list(object({ from_port = number, protocol = string, to_port = number }))
}

variable "machine_image" {
  description = "Value for machine image"
  type        = string
}

variable "instance_type" {
  description = "Value for instance type"
  type        = string
}

variable "instance_name" {
  description = "Value for name tag for instance name"
  type        = string
}

variable "instance_subnet" {
  description = "Value for subnet to choose for instance (between 0 to 3)"
  type        = number
}

variable "instance_volume_size" {
  description = "Value for volume size of the instance"
  type        = number
}

variable "instance_volume_type" {
  description = "Value for volume type of the instance"
  type        = string
}