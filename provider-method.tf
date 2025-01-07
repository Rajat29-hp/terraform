# 1st method

  provider "aws" {
  region = "eu-north-1"
  access_key = "<access-key>"
  secret_key = "<secret-key>"
  }

# 2nd method
provider "aws" {
region = "eu-north-1"
shared_credentials_file = "/Users/tf_user/.aws/creds"
profile = "devops"
}

# 3rd method (/root/.bashrc)
echo "export AWS_ACCESS_KEY_ID= "<access-key>"
echo "export AWS_SECRET_ACCESS_KEY= "<secret-key>"
