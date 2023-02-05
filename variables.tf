variable "aws_region" {
  description = "Preferred region in which to launch EC2 instances. Defaults to us-east-1"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.medium"
}

variable "name_tag" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "elastic"
}

variable "key_name" {
  description = "The name of the key-pair used to access the EC2 instances"
  type        = string
}
