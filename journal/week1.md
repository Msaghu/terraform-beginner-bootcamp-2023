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

# Terraform and Input Variables
## Terraform Cloud Variables

In Terraform we can set two types of variables:
- Environment Variables - those that we would normally set in the bash terminal e.g AWS Credentials.
- Terraform Variables - those that we would normally set in the tfvars files

We can set TerraformCloud variables to be *sensitive* so they are not shown visibly in the UI.

## Loading Terraform Variables
[Terraform Input variables documentation](https://developer.hashicorp.com/terraform/language/values/variables)

### Var flag
We can use the `-var` flag to set an input variable, or override a variable in the tfvars file e.g 
`terraform -var user_uuid="my-user-uuid"`

### Var-file flag

- DO research on this flag

### terraform.tfvars

This is the default file to load in terraform variables in bulk

### auto.tfvars

- DO research on this flag

### Order of Terraform variables

- Do reserach on which terraform variables takes precedence

## Moved from remote to local state