variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string 
}
variable "ami" {
    description = "The AMI ID to use for the EC2 instance"
    type        = string
}
variable "environment" {
    description = "The environment for the infrastructure (e.g., dev, staging, production)"
    type        = string
}
variable "volume_type" {
    description = "The volume type for the EC2 instance"
    type        = string
}
variable "instance_count" {
    description = "The number of EC2 instances to create"
    type        = number
}
variable "instance_type" {
    description = "The type of EC2 instance to create"
    type        = string
  
}
variable "dynamodb_table_name" {
    description = "The name of the DynamoDB table"
    type        = string
}
variable "hash_key" {
    description = "The hash key for the DynamoDB table"
    type        = string
}