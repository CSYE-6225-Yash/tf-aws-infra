# Creating UUID for s3 bucket
resource "random_uuid" "my_s3_bucket" {
}

# Creating s3 bucket with above UUID as bucket name
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "${random_uuid.my_s3_bucket.result}"
  force_destroy = true

  tags = {
    Name        = var.bucket_name
  }
}

# Applying default encryption to bucket
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# Lifecycle policy
resource "aws_s3_bucket_lifecycle_configuration" "bucket_lifecycle_policies" {
  bucket = aws_s3_bucket.my_s3_bucket.id

  rule {
    id = var.standard_to_ia_policy_s3.id

    filter {}

    status = "Enabled"
    
    transition {
      days          = var.standard_to_ia_policy_s3.days
      storage_class = var.standard_to_ia_policy_s3.storage_class
    }
  }
}