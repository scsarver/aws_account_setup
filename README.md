### AWS Account Setup using Terraform ###
The purpose of this project is to take a brand new AWS account and run a series of updates to bring the state of the account into a reasonable state for use and handle the base levels of securing an account like the following:
- ~~Activate MFA on your root account~~ (This step must be configured through the Console)
- Creating an account alias
- Create individual IAM users
- Use groups to assign permissions
- Apply an IAM password policy
- ~~Delete your root access keys~~ (This step must be configured through the Console)
- Enable multi-region logging enabled CloudTrail
- Create the resources for terraform remote state(s3 and DynamoDb for locking).

##### How to run this project #####
- Configure your AWS credentials with a key set that has the rights to manage IAM resources. Since I am using this project to configure a fresh aws account I used the root accounts keys. After the first run I created and used IAM user keys.
- Make sure Terraform is installed
- Set your variable values in terraform.tfvars
  - account alias
  - IAM prefix (this will be the prefix for your admin, poweruser and readonly users)
  - remote state prefix (used in setting up the Dynamo Db table and keys)
  - remote state s3 bucket name
  - cloud trail s3 bucket name
- Run terraform init to make sure your providers are downloaded.
    ```
    $ terraform init
    ```
- Run terraform plan to show what resources will be created.
  ```
  $ terraform plan
  ```
- Run terraform apply to build the resources shown in your plan.
  ```
  $ terraform Apply
  ```


##### Notes:
- This project is expecting the AWS credentials file to be already configured by using the AWS configure command. If you are not going to use this then you should uncomment the variables and add the values to your tfvars file.  
- This project is not using remote state as the expectations are for this project to be an initial setup deferring additional asset builds to another project that can have remote state.


##### References:
- https://aws.amazon.com/answers/security/aws-secure-account-setup/
- http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html

##### TODO:
- Add a logging bucket for remote state.
