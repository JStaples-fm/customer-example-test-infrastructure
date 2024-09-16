All notable changes to this project will be documented in this file.

## [2.0.0] - 2024-07-29

### Breaking Change

* Added enviroment to the key prefix of the terraform state file so you can deploy multiple environments into a single AWS account. This will break any existing deployments that are upgraded as it will be looking for a .tfstate file that doesn't exist so it will try and re-deploy all resources. To work around this you will need to move the existing .tfstate file into a /*<environment>* prefix/folder in the terraform state S3 bucket and then create a PR / Terraform plan to confirm no changes are required.

## [1.3.1] - 2024-07-16

### Feature

* Added the use of a Checkov config file located /.checkov/checkov-config.yaml.
  * This can be used to configure the Checkov scans in GHA.

## [1.3.0] - 2024-07-02

### Feature

* Truncated Terraform plan output to Github comment to workaround Github comment size limit

## [1.2.0] - 2024-06-27

### Feature

* Moved checkov scan to separate GH actions workflow to stop blocking TF deployments.
  * Can be found at .github/workflows/checkov.yaml

## [1.1.0] - 2024-05-30

### Feature

* Moved the following variables into Github variables: AWS_REGION, CUSTOMER_NAME, PROJECT_NAME, GHA_IAM_ROLE_NAME, AWS_ACCOUNT_ID, ENVIRONMENT

## [1.0.1] - 2024-05-23

### Feature

* Added default AWS region as variable from GHA

## [1.0.0] - 2024-02-01

### Feature

* First release
