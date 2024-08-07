variable "ports" {
  type = list(number)

}

variable "aws_ami" {
  type = string

}

variable "aws_instance_type" {
  description = "The type of AWS instance to use"
  type        = string
}


variable "aws_access_key" {
  type = string
}


variable "aws_secret_key" {
  type = string
}

variable "AWS_Region" {
  type = string
}
