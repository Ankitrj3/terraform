variable "ec2_instance_type" {
  default     = "t2.micro"
  type = string
}
variable "ec2_ami" {
  default     = "ami-0f918f7e67a3323f0"
  type = string
}
variable "ec2_default_volume_size" {
  default     = 10
  type = number
}
variable "ec2_volume_type" {
  default     = "gp3"
  type = string
}
variable "environment" {
#   default     = "production"
  default = "dev"
  type = string
}