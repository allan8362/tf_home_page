provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "home_page" {
  bucket_prefix = var.bucket_prefix
  acl           = "public-read"

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_policy" "home_page" {
  bucket = aws_s3_bucket.home_page.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Id": "Policy1606409000027",
    "Statement": [
        {
            "Sid": "Stmt1606408526495",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.home_page.bucket}/*"
        }
    ]
}
POLICY
}