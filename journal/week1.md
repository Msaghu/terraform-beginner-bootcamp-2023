# Terraform Beginner Bootcamp 2023 - week 1

## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf
├── variables.tf       # stores the structure of input variables
├── terraform.tfvars   # stores the data of variables we want to load to our Terraform project
├── providers.tf       # defines required providers and their configuration
├── outputs.tf         # stores our outputs
└── README.md          # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
