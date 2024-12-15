# Terraform AWS EC2 Project

This project demonstrates how to use Terraform to create and manage an AWS EC2 instance. It includes Terraform configuration files and a script to set up the instance with required software. Below is an overview of the project's structure, logic, and how to use it.

## Project Structure

### 1. `instance.tf`
This file initializes and configures the AWS EC2 instance. It defines the instance type, AMI, key pair, security groups, and other necessary properties.

### 2. `providers.tf`
Specifies the provider for the project. In this case, the provider is AWS. This file includes the configuration needed to connect Terraform to AWS.

### 3. `variables.tf`
Contains all variable declarations to make the configuration dynamic and reusable. Variables include:
- AWS region
- Instance type
- Key name
- AMI ID

### 4. `script.sh`
A shell script executed during instance initialization to install necessary software like Ansible and other dependencies. This script is passed to the EC2 instance via user data.

### 5. `dovkey.pub`
A public SSH key used to securely connect to the EC2 instance. The corresponding private key is not included for security purposes.

## Logic of the Project
The project follows these steps:
1. Terraform uses `providers.tf` to connect to the AWS environment.
2. `variables.tf` allows you to customize various aspects of the infrastructure.
3. `instance.tf` provisions an EC2 instance with the desired configuration.
4. The EC2 instance runs `script.sh` on startup, setting up the necessary software.
5. The `dovkey.pub` is used to enable SSH access to the instance.

## Prerequisites

- Terraform installed on your system
- AWS CLI configured with appropriate credentials
- A public-private SSH key pair (e.g., `dovkey.pub` and its corresponding private key)

## How to Run This Project

### 1. Initialize the Terraform Project
Run the following command to initialize Terraform and download the necessary provider plugins:
```bash
terraform init
```

### 2. Validate the Configuration
Ensure that the Terraform configuration files are syntactically correct:
```bash
terraform validate
```

### 3. Plan the Infrastructure
Review the execution plan to ensure everything is configured correctly:
```bash
terraform plan
```

### 4. Apply the Configuration
Create the resources defined in the configuration files:
```bash
terraform apply
```
You will be prompted to confirm. Type `yes` to proceed.

### 5. Connect to the Instance
Use the private key associated with `dovkey.pub` to connect to the instance:
```bash
ssh -i path/to/private_key.pem ec2-user@<INSTANCE_PUBLIC_IP>
```
Replace `<INSTANCE_PUBLIC_IP>` with the public IP address of the EC2 instance.

### 6. Destroy the Infrastructure
When you no longer need the resources, destroy them to avoid incurring costs:
```bash
terraform destroy
```
You will be prompted to confirm. Type `yes` to proceed.

## Notes
- Ensure your AWS credentials have the necessary permissions to create EC2 instances.
- Keep your private key file secure and do not share it.
- Adjust the `script.sh` file to suit your specific software installation needs.

---

Feel free to customize and extend this project as needed!
