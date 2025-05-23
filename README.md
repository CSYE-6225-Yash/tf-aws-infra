# First you need to install following packages

aws-cli

terraform

# Configure aws-cli using following steps -

For creating aws-cli profile use following command -

`aws configure --profile profile_name`

For using that profile you need to setup temparary environment variables in your system do this with following command -

For windows -

`set AWS_PROFILE=profile_name`

For linux/mac -

`export AWS_PROFILE=profile_name`

Note - Before suing terraform commands you need to set aws profile.

# Setting up infrastructure using terraform -

Following commands are used for seting up infrastucture using terraform -

`terraform init` - This command installs plugins that are required and set up the working directoty containing configuration files.

`terraform validate` - This command checks whether the configuration is valid or not.

`terraform plan` - This command shows changes required for current configurations.

`terraform apply` - This command applies configuration to the infrastructure.

`terraform destroy` - This command destroys created infrastructure.

`terraform fmt` - This command formats files in the correct indentation.

Minimum commands to run terraforms are as follows -

`terraform init` - only for first time

Note in below commands variable file is passed directly using -var-file option

`terraform plan -var-file=file_name.tfvars` - This is optional you can also apply it directly

`terraform apply -var-file=file_name.tfvars`

`terraform destroy -var-file=file_name.tfvars` - After seeing infrastructure you can tear it down/ destroy it.

# Running this terraform will give you following infrastructure -

- vpc : It creates vpc and public and private subnets in it.

- iam role/policy : It also creates iam role and policy for ec2 instance in order for application on ec2 to call this services.

- aws rds instance : It creates rds instance and attaches aws ec2 security group so that it can access this rds using iam roles.

- aws ec2 instance : It creates aws instance by using custom image provided by the variable file while running and also configures security group for it.

- aws s3 bucket : It creaetes aws s3 bucket to store objects provided by the web application.

# Command to import ssl certificate using aws cli

- Here I have used ssl certificate from name cheap so in my case certificate file is with the extension .crt and certificate-chain is with the extension .ca-bundle and key file has extension .key(generated with openssh)

`aws acm import-certificate --certificate fileb://your_certificate.crt --certificate-chain fileb://your_certificate_chain_file.ca-bundle --private-key fileb://your_private_key.key`

- Note that this files also could be .pem files as stated in the official aws documentation.