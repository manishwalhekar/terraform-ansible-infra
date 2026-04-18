# terra-infra

Terraform project for multi-environment AWS infrastructure — `dev`, `stg`, and `prd` — using a shared module-based architecture with remote state.

---

## Project Structure (overview) ##complete tree structure is given at bottom

```
.
├── environments/
│   ├── dev/           # t3.small + t3.micro
│   ├── stg/           # mirrors dev
│   └── prd/           # dev instances + c7i-flex.large
│
├── global/
│   └── network/       # VPC, subnets, IGW — provisioned once, shared by all envs
│
├── modules/
│   ├── compute/       # EC2 instances + key pair
│   ├── network/       # VPC, subnets, route tables
│   └── security/      # security groups
│
└── keys/              # SSH key pair (see Security Notes)
```

---

## What gets provisioned

**Network** (shared, `global/network`): a single VPC (`10.0.0.0/16`) with one public subnet per environment, an internet gateway, and a route table. Provisioned once and referenced by all envs via remote state.

**Per environment:**

| Env | Instances | Subnet |
|-----|-----------|--------|
| dev | `t3.small` (app), `t3.micro` (worker) | `10.0.1.0/24`, us-east-1a |
| stg | `t3.small` (app), `t3.micro` (worker) | `10.0.2.0/24`, us-east-1b |
| prd | `t3.small` (app), `t3.micro` (worker), `c7i-flex.large` (compute) | `10.0.3.0/24`, us-east-1c |

AMI is always the latest Ubuntu 22.04 LTS from Canonical, resolved at plan time.

---

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with credentials that have EC2, VPC, S3, and DynamoDB permissions

---

## Getting Started

### 1. Bootstrap remote state (one-time)

```bash
aws s3api create-bucket --bucket terra-infra-bucket-1 --region us-east-1

aws dynamodb create-table \
  --table-name terraform-lock-table \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1
```

### 2. Provision the network (one-time)

```bash
cd global/network
terraform init && terraform apply
```

### 3. Provision an environment

```bash
cd environments/dev   # or stg / prd
terraform init && terraform apply
```

### 4. View outputs

```bash
terraform output public_ips
terraform output ssh_commands
```

### 5. Tear down

```bash
# Always destroy environments before destroying the network
cd environments/dev && terraform destroy
cd global/network && terraform destroy
```

---

## Remote State

State is stored in S3 with DynamoDB locking. Each layer has its own key:

| Layer          | S3 Key                              |
|----------------|-------------------------------------|
| global/network | `global/network/terraform.tfstate`  |
| dev            | `dev/terraform.tfstate`             |
| stg            | `stg/terraform.tfstate`             |
| prd            | `prd/terraform.tfstate`             |

---

## Security Notes

> **Keys in repo:** `keys/terra-infra-key` is a private key — remove it from git and add `keys/` to `.gitignore`. Store private keys in `~/.ssh/` or AWS SSM Parameter Store.

> **SSH open to world:** All environments allow SSH from `0.0.0.0/0`. Restrict to your IP/VPN range in `stg` and `prd`.
---

## Notes

- Always apply `dev` → `stg` → `prd` in order.
- Run `terraform plan` before every `apply`.
- The network layer must exist before any environment can be provisioned.

## tree
## Project Structure

```text
.
├── README.md
├── environments
│   ├── dev
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   │
│   ├── prd
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   │
│   └── stg
│       ├── backend.tf
│       ├── main.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
├── global
│   └── network
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── terraform.tfvars
│       └── variables.tf
│
└── modules
    ├── compute
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    │
    ├── network
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    │
    └── security
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```