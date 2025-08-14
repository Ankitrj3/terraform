resource "aws_s3_bucket" "awsremoteinfrabucket" {
  bucket = "awsremoteinfrabucket"
  tags = {
    Name        = "awsremoteinfrabucket"
  }
}