#Uncomment if you are explicitly setting this variable in your tfvars file.
#variable "aws_access_key" {
#    type = "string"
#    description = "The value of the aws access key needed for the aws provider to authenticate to the service."
#}

#Uncomment if you are explicitly setting this variable in your tfvars file.
#variable "aws_secret_key" {
#    type = "string"
#    description = "The value of the aws secret key needed for the aws provider to authenticate to the service."
#}

variable "account_alias" {
    type = "string"
    description = "The value to be used when creating your accounts alias."
}

variable "iam_prefix" {
    type = "string"
    description = "The prefix string used to personalize the iam roles admin, poweruser and readonly."
}
