resource "aws_cloudtrail" "cloudtrail" {
  name                          = "${var.cloud_trail_s3_bucket_name}"
  s3_bucket_name                = "${aws_s3_bucket.s3_for_cloudtrail.id}"
  s3_key_prefix                 = "cloudtrail"
  include_global_service_events = true
  enable_logging                = true
  is_multi_region_trail         = true
  enable_log_file_validation    = true
  tags {
    tool = "terraform"
    project = "aws_account_setup"
  }
}

resource "aws_s3_bucket" "s3_for_cloudtrail" {
  bucket        = "${var.cloud_trail_s3_bucket_name}"
  acl    = "private"
  force_destroy = true

  versioning {
      enabled = true
  }

  tags {
    tool = "terraform"
    project = "aws_account_setup"
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::${var.cloud_trail_s3_bucket_name}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${var.cloud_trail_s3_bucket_name}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
