variable "image_id" {
  description = "RHEL-9 AMI ID"
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  description = "instance"
  type        = string
  default     = "t2.micro"
}

variable "tags" {
  type        = map
  default = {
    Name     = "db"
    project = "Expense"
    Module = "DB"
  }
}

variable "sg_name" {
  description = "sg_name"
  type        = string
  default     = "allow_everything_all"
}

variable "sg_description" {
  description = "sg_description"
  type        = string
  default     = "allow_everything_all"
}

variable "port" {
  description = "port"
  default     = 0
}

variable "protocol" {
  description = "protocol"
  default     = "tcp"
}

variable "allowed_cidr" {
  description = "cidr_blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags1" {
  type        = map
  default = {
    Name     = "allow_everything-1"
    project = "Expense"
  }
}