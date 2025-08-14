resource "aws_dynamodb_table" "backend_infra_table" {
  name           = "backend_infra_table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "backend_infra_table"
  }
}