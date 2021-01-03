terraform {
  backend "s3" {
    bucket = "fugue-ci-cd-example-tfstate-688244514781-us-east-1"
    key    = "tfstate-aws/remote_state.tfstate"
    region = "us-east-1"

    dynamodb_table = "tfstate-lock"
  }
}
