module "dev-infra" {
   source = "./infra-app"
   bucket_name = "ankit-bucket"
   environment = "dev"
   ami = "ami-0f918f7e67a3323f0"
   instance_type = "t2.micro"
   instance_count = 1
   volume_type = "gp3"
   dynamodb_table_name = "infra_table"
   hash_key = "StudentID"
}
module "staging-infra" {
   source = "./infra-app"
   bucket_name = "ankit-bucket-staging"
   environment = "staging"
   ami = "ami-0f918f7e67a3323f0"
   instance_type = "t2.micro"
   instance_count = 1
   volume_type = "gp3"
   dynamodb_table_name = "infra_table_staging"
   hash_key = "RollNo"
}