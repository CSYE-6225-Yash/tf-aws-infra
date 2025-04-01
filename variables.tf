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

variable "db_pg_name" {
  description = "Value for name of the database parameter group"
  type        = string
}

variable "db_pg_family" {
  description = "Value for family of the database parameter group"
  type        = string
}

variable "db_engine" {
  description = "Value for engine of the database"
  type        = string
}

variable "db_instance_class" {
  description = "Value for instance class of the database"
  type        = string
}

variable "db_multizone_deployment" {
  description = "Value for multizone deployment of the database"
  type        = bool
}

variable "db_identifier" {
  description = "Value for id of the database"
  type        = string
}

variable "db_username" {
  description = "Value for username of the database"
  type        = string
}

variable "db_password" {
  description = "Value for password of the database"
  type        = string
}

variable "db_subnet" {
  description = "Value for subnet ( in number ) of the database"
  type        = number
}

variable "db_public_accessible" {
  description = "Value for publically access of the database"
  type        = bool
}

variable "dbname" {
  description = "Value for name of the database"
  type        = string
}

variable "bucket_name" {
  description = "Value for name tag of the s3 bucket"
  type        = string
}

variable "standard_to_ia_policy_s3" {
  description = "Value for days value of the lifecycle policy of s3 to shift to ia"
  type        = object({ id = string, days = number, storage_class = string })
}

variable "db_security_group_name" {
  description = "Value for name of the database security group"
  type        = string
}

variable "db_security_group_description" {
  description = "Value for description of the database security group"
  type        = string
}

variable "db_security_group_ingress_rule" {
  description = "Value for ingress rule of security group"
  type        = list(object({ from_port = number, protocol = string, to_port = number }))
}

variable "db_subnet_group_name" {
  description = "Value for name tag of the database subnet group"
  type        = string
}

variable "load_balancer_security_group_name" {
  description = "Value for name tag of the load balancer security group"
  type        = string
}

variable "load_balancer_security_group_description" {
  description = "Value for description of the load balancer security group"
  type        = string
}

variable "load_balancer_security_group_ingress_rule" {
  description = "Value for ingress rule for load balancer"
  type        = list(object({ from_port = number, protocol = string, to_port = number }))
}

variable "ssh_key_name" {
  description = "Value for key name for ec2 instances"
  type        = string
}

variable "launch_template_name" {
  description = "Value for name for launch template"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Value for name for autoscaling group"
  type        = string
}

variable "autoscaling_group_cooldown" {
  description = "Value for cooldown for autoscaling group"
  type        = number
}

variable "autoscalling_group_min_size" {
  description = "Value for min size for autoscaling group"
  type        = number
}

variable "autoscalling_group_max_size" {
  description = "Value for max size for autoscaling group"
  type        = number
}

variable "autoscalling_group_desired_capacity" {
  description = "Value for desired capacity for autoscaling group"
  type        = number
}

variable "webapp_dns_zone_id" {
  description = "Value for zone id for webapp dns"
  type        = string
}

variable "webapp_domain_name" {
  description = "Value for domain name for webapp"
  type        = string
}