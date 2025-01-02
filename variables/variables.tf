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
    default     = "db"
    project = "Expense"
    Module = "DB"
  }
}