terraform {
  backend "s3" {
    bucket = "fugue-ci-cd-example-tfstate-688244514781-us-east-1"
    key    = "tfstate-aws/main.tfstate"
    region = "us-east-1"

    dynamodb_table = "tfstate-lock"
  }
}
