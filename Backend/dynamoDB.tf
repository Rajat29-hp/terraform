resource "aws_s3_bucket" "first"{
  bucket = "My bucket"
    force_destroy = true
  tags={
  name = "Terraform state file Storage"
  }
}

resource "aws_s3_bucket_versioning""example"{
 bucket = aws_s3_bucket.first.id
   versioning = configuration {
    status = "enabled"
   }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-state-locking"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockId"
    
  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
