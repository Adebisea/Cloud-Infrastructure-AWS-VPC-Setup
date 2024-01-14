# Project Name

## Description
This project uses Terraform to manage infrastructure on AWS. Follow the instructions below to set up your environment.

## Getting Started

### Prerequisites
Terraform
AWS Account with Access Key and Secret Key

### Configuration
Create a config.txt file in the root of the project.

Add the following content to config.txt:
```
[default]
AWS_ACCESS_KEY_ID="your_aws_access_key"
AWS_SECRET_ACCESS_KEY="your_aws_secret_key"
Replace "your_aws_access_key" and "your_aws_secret_key" with your actual AWS credentials.
```

### Initializing Terraform
Run the following command in the terminal to initialize Terraform:

`terraform init`
This command initializes your working directory, downloading the necessary providers and modules.
