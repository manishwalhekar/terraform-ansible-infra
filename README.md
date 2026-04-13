## Project Structure

```
.
├── environments
│   ├── dev
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── prd
│   │   ├── backend.tf
│   │   ├── main.tf
│   │   ├── providers.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── stg
│       ├── backend.tf
│       ├── main.tf
│       ├── providers.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
    ├── compute
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    ├── network
    │   ├── main.tf
    │   ├── outputs.tf
    │   └── variables.tf
    └── security
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```
