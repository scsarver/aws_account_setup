### AWS Account Setup using Terraform ###
The purpose of this project is to take a brand new account and run a series of updates to bring the state of the account into a reasonable state for use and handle the base levels of securing an account like the following:
- ~~Activate MFA on your root account~~ (This step must be configured through the Console)
- Creating an account alias
- Create individual IAM users
- Use groups to assign permissions
- Apply an IAM password policy
- ~~Delete your root access keys~~ (This step must be configured through the Console)

##### How to run this project #####
- Configure your AWS credentials with a key set that has the rights to manage IAM resources. Since I am using this project to configure a fresh aws account I used the root accounts keys.
- Make sure Terraform is installed
- Set your account alias in terraform.tfvars
- Set your IAM prefix in terraform.tfvars (this will be the prefix for your admin, poweruser and readonly users)
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


##### TODO:
- Add s3 bucket for remote state
- Add DynamoDb table for remote state locking.
