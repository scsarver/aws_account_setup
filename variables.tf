#Uncomment if you are explicitly setting this variable in your tfvars file.
#variable "aws_access_key" {
#    type = "string"
#    description = "The value of the AWS access key needed for the AWS provider to authenticate to the service."
#}

#Uncomment if you are explicitly setting this variable in your tfvars file.
#variable "aws_secret_key" {
#    type = "string"
#    description = "The value of the AWS secret key needed for the AWS provider to authenticate to the service."
#}

variable "account_alias" {
    type = "string"
    description = "The value to be used when creating your accounts alias."
}

variable "iam_prefix" {
    type = "string"
    description = "The prefix string used to personalize the IAM roles admin, poweruser and readonly."
}

variable "remote_state_prefix" {
  type = "string"
  description = "The value to be used when creating the remote state locking dynamo db table."
}

variable "remote_state_s3_bucket_name" {
    type = "string"
    description = "The value to be used when creating the s3 bucket where remote state for terraform will be stored."
}

variable "cloud_trail_s3_bucket_name" {
    type = "string"
    description = "The value to be used when creating the s3 bucket where your cloud trail logs will be stored."
}
