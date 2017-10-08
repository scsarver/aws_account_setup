resource "aws_s3_bucket" "s3_for_remote_state" {
  bucket        = "${var.remote_state_s3_bucket_name}"
  acl    = "private"
  #force_destroy = true

  versioning {
      enabled = true
  }

  lifecycle {
      prevent_destroy = true
  }
  tags {
    tool = "terraform"
    project = "aws_account_setup"
  }

}

resource "aws_dynamodb_table" "dynamodb_for_state_lock" {
  name           = "${var.remote_state_prefix}-remote-state-locking"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "${var.remote_state_prefix}-lock-id"

  attribute {
    name = "${var.remote_state_prefix}-lock-id"
    type = "S"
  }
}
