resource "aws_s3_bucket" "infra_bucket" {
    bucket = "infra-project-bucket-12345678910" # Replace with a unique bucket name
    
    tags = {
        Name        = var.s3_bucket_name
        Environment = "Dev"  
    }
}

resource "aws_s3_bucket_versioning" "infra_bucket_versioning" {
    bucket = aws_s3_bucket.infra_bucket.id

    versioning_configuration {
        status = "Enabled"
    }
  
}