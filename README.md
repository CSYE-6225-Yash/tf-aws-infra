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