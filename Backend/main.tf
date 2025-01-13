# The Aws S3 bucket stores the state (terraform.tfstate file)

terraform {
  backend "s3" {
    bucket       = "mybucket"
    key          = "my-backend/terraform.tfstate"
    dynamo_table = "terraform-state-locking"
  }
}

