variable "aws_region" {
  type        = string
  description = "The AWS region to create things in."
  default     = "us-east-2"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Range of IPv4 address for the VPC."
  default     = "172.17.0.0/16"
}

variable "az_count" {
  type        = string
  description = "The number of Availability Zones that we will deploy into"
  default     = "2"
}
