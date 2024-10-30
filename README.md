# WordPress AWS EC2 Deployment with Terraform

## Overview
This project provides a fully automated Terraform setup to deploy a WordPress website on AWS EC2. It uses reusable modules to define infrastructure components like EC2 instances, networking, and security groups, following the DRY (Don't Repeat Yourself) principle for maintainability and scalability. The deployment is repeatable and modular, which allows for a quick setup across various environments.

## Local Setup

### Prerequisites
Youou have:
- An AWS account with necessary permissions (EC2, VPC, and security group management).
- [Terraform](https://www.terraform.io/downloads.html) (v0.12+) installed.
- [AWS CLI](https://aws.amazon.com/cli/) configured with your credentials.

### Steps

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd <repository-folder>
   ```

2. **Initialize Terraform**
   Initialize the working directory to install necessary modules and plugins.
   ```bash
   terraform init
   ```

3. **Set AWS Credentials**
   Export your AWS credentials as environment variables or set up an `.env` file if using a local configuration:
   ```bash
   export AWS_ACCESS_KEY_ID=your_access_key
   export AWS_SECRET_ACCESS_KEY=your_secret_key
   ```

4. **Plan and Apply the Deployment**
   Run the following to preview the infrastructure and deploy:
   ```bash
   terraform plan
   terraform apply
   ```
   Confirm to start the deployment. Terraform will set up the EC2 instance, networking, and security.

5. **Access WordPress**
   After deployment, retrieve the public IP of your EC2 instance and access your WordPress site by navigating to:
   ```text
   http://<instance-public-ip>
   ```

This completes the local setup and deployment of WordPress on AWS EC2 using Terraform.