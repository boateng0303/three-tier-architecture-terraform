# three-tier-arch-aws-terraform
Provision three tier architecture on AWS using Terraform



---

## 🏗️ Architecture Overview

The infrastructure follows a standard **three-tier architecture**:

### 🔹 Web Tier
- **Auto Scaling Group** with EC2 instances in public subnets
- **Application Load Balancer (ALB)** for incoming traffic distribution

### 🔹 Application Tier
- Additional EC2 instances (optional) in private subnets for app processing

### 🔹 Data Tier
- **Amazon RDS** (MySQL/PostgreSQL) in private subnets

### 🔐 Security
- Properly scoped **Security Groups**
- ALB only accepts HTTP/S traffic
- RDS only accessible from app layer (via SG rules)
- No direct SSH to private instances (bastion host optional)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/boateng0303/three-tier-architecture-terraform.git
cd three-tier-architecture-terraform
```
# 📂 Key Terraform Files

| File               | Purpose                                                       |
| ------------------ | ------------------------------------------------------------- |
| `vpc.tf`           | Defines VPC, subnets, route tables, IGW, and NAT Gateway      |
| `alb.tf`           | Sets up Application Load Balancer, listener, and target group |
| `asg.tf`           | Launch template + Auto Scaling Group (ASG) for EC2 instances  |
| `rds.tf`           | Configures Amazon RDS in private subnets                      |
| `backend.tf`       | Remote backend configuration for state management             |
| `outputs.tf`       | Defines outputs like ALB DNS, RDS endpoint, etc.              |
| `variables.tf`     | All input variables with descriptions and default values      |
| `terraform.tfvars` | Values supplied to variables                                  |
| `versions.tf`      | Specifies Terraform and AWS provider versions                 |



# 🧑🏽‍💻 Author
Kwasi Boateng
GitHub: @boateng0303
