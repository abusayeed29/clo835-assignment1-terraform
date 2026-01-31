
### Module Overview

| Module | Description |
|------|-------------|
| `ecr` | Creates Amazon ECR repositories |
| `iam` | Creates IAM role and instance profile |
| `security-group` | Configures EC2 security group rules |
| `ec2` | Launches EC2 instance and installs Docker |

---

## 🔐 Security & Best Practices

- Terraform state files are **excluded from version control**
- `.gitignore` prevents committing:
  - `.terraform/`
  - `*.tfstate`
  - `*.tfvars`
- SSH access restricted to a single IP address
- Modular Terraform structure for reusability and clarity
- Default AWS VPC used as per assignment requirement

---

## ⚙️ Prerequisites

Ensure the following before deployment:

- AWS CLI configured with valid credentials
- Terraform installed (version `>= 1.4`)
- Existing EC2 Key Pair in AWS
- Your public IP address (CIDR format)

---

## 🚀 Deployment Steps

Navigate to the `terraform/` directory and run:

```bash
terraform init
terraform plan
terraform apply
