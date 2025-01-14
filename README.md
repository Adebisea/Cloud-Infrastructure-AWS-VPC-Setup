# Cloud Infrastructure: AWS VPC Setup

## Description
This project deploys VPC infrastructure containing 6 subnets (3 private and 3 public) using Terraform to enable scalability and fault tolerance across Availability Zones.
The public subnets are configured with a public route table that included a route to an Internet Gateway (IGW), ensuring direct internet access for public-facing resources. 
Private subnets are linked to a private route table that routes outbound traffic through a NAT Gateway, maintaining secure internet access for private resources.


## Getting Started

### Prerequisites
- Terraform
- AWS Account with Access Key and Secret Key

### Configuration
- Create a config.txt file in the root of the project.
- Add the following content to config.txt:
```
[default]
AWS_ACCESS_KEY_ID="your_aws_access_key"
AWS_SECRET_ACCESS_KEY="your_aws_secret_key"
```
Replace "your_aws_access_key" and "your_aws_secret_key" with your actual AWS credentials.

### Initializing Terraform
Run the following command in the terminal to initialize Terraform:
```
terraform init
```
This command initializes your working directory, downloading the necessary providers and modules.

### Usage
To deploy the VPC infrastructure, navigate to the Terraform directory and run:
```
terraform apply --auto-approve
```
To clean up and destroy the infrastructure, run:
```
terraform destroy --auto-approve
```
