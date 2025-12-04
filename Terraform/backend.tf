terraform {
  backend "s3" {
    bucket         = "infra-project-bucket-12345678910"  # Replace with your S3 bucket name
    key            = "terraform/state"                     # Path within the bucket
    region         = "eu-north-1"                          # AWS region
    dynamodb_table = "terraform-state-lock"                # DynamoDB table for state locking
    encrypt        = true                                  # Enable encryption
  }
}