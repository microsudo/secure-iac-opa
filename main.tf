provider "aws" {
  region = "us-west-1"
}

resource "aws_vpc" "my_fugue_cicd_vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "my-fugue-cicd-vpc"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.my_fugue_cicd_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_iam_policy" "basically_deny_all" {
  name        = "some_policy"
  path        = "/"
  description = "Some policy with a long description that denies anything"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "*"
      ],
      "Effect": "Deny",
      "Resource": "*"
    }
  ]
}
EOF
}