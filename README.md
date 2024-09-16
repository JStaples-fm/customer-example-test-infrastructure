# <<< ADD REPOSITORY NAME HERE >>>

<<< Add summary of what this repository contains >>>

AWS Account ID: << ADD >>

## Prerequisites

### AWS Account Setup

Before deploying using Github Actions you need to have deployed the [GithubActionsPrereqs.yaml](https://github.com/hellofiremind/internal-ce-github-actions-prereqs-template) template into the target AWS account.

### Pre push commands

Before pushing to this repository you need to run the following command (see below about automating this with pre-commit) from the root directory to make sure that Terraform is formatted and this readme file has been updated with the resources being deployed.

``` terraform
terraform fmt -recursive && terraform-docs markdown table --output-file README.md --output-mode inject ./
```

### Setup pre-commit hooks

You can automate running the Terraform Format / Docs command by setting up pre-commit hooks as follows:

```shell
pip3 install pre-commit
```

```shell
pre-commit install
```

### Setup GitHub Variables

#### [Setup Environment Variables](https://docs.github.com/en/actions/learn-github-actions/variables#creating-configuration-variables-for-an-environment)

- Navigate to the GitHub repository **Settings**.
- Select the **Environments** tab on the left navigation bar.
- Click the **New Environment**.
- Type either **development**, **staging** or **production** depending on the environment you are setting up.
- Press the **Add environment variable** button and add all the following variables:

  - `AWS_ACCOUNT_ID`: AWS Account ID.
  - `ENVIRONMENT`: Environment name (Must be **sbx, dev, stg, prd**).

#### [Setup Repo Variables](https://docs.github.com/en/actions/learn-github-actions/variables#creating-configuration-variables-for-a-repository)

- Navigate to the GitHub repository **Settings**.
- Select the **Secrets and variables** tab on the left navigation bar.
- Select the **Actions** drop down option.
- Change from the Secrets tab to the **Variables** tab.
- Press **New repository variable** button and add the following:
  - `AWS_REGION`: Default AWS region deploying into
  - `CUSTOMER_NAME`: Customer name (Maximum 4 characters).
  - `PROJECT_NAME`: Project name (Maximum 5 characters).
  - `GHA_IAM_ROLE_NAME`: GitHub actions role name, this is **GithubActionsDeploymentIAMRole** unless changed.

## Repository directories

### `.github`

Contains GitHub action workflow script terraform.yaml which will run whenever you create a PR or merge into any of the following branches: **sandbox, development, staging, production**

### `modules`

Contains any Terraform sub modules

### `environments`

Contains the Terraform variables file for each environment

## Generated Terraform documentation

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.27 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Default AWS region deploying into | `string` | n/a | yes |
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Customer name (Maximum 4 characters) | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name (Maximum 5 characters) | `string` | n/a | yes |
| <a name="input_repository_name"></a> [repository\_name](#input\_repository\_name) | Github repository name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
