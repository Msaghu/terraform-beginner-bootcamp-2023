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

## Dealing with configuration drift

## What happens when we lose our state file?

If we lose the state file, we might have to manually delete all the cloud infrastructure.

We can use terraform import but it may not work for all cloud resources. Check th

### Fix missing resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform import](https://developer.hashicorp.com/terraform/tutorials/state/state-import?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)

[AWS S3 bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

DO: import.tf

### Fix manual Configuration

When someone deletes/changes cloud resources manually using clickops.

## Fix using Terraform Refresh 

```sh
terraform apply -refresh-only -auto-approve
```

## Teraform Modules

### Terraform module structure

It is recommended to place modules in a modules directory when developing modules locally.

### Passing input Variables

We can pass input variables to our module.

The module has to declare these Terrafom variables, in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```

### Module Sources

Using the source , we can import the modules from various places e.g locally, Github,Terraform registry.

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
}
```

## Considerations on using ChatGPT to write Teraform

LLMs such as ChtGPT may not be trained on the latest documentation or information about Terraform and may therefore give older examples that may have been deprecated, often affecting providers.

## Working with files in Terraform

### Fileexists Function

This is a built in Teraform function that checks the existence of a file.

```tf
condition     = fileexists(var.error_html_file_path)
```

### Filemd5

[Filemd5 Function](https://developer.hashicorp.com/terraform/language/functions/filemd5)


### Path Variable

In Terafrom , there is a special variable called path that allows us to reference local paths.
- path.module = gives the path for the current module
- path.root = gets the path for the root module

```tf
resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${path.root}/public/index.html"
  etag = filemd5(var.index_html_file_path)
}
```

[Special Path Variable](https://developer.hashicorp.com/terraform/language/expressions/references#filesystem-and-workspace-info)

## Errors encountered 
1. Encountered the following error when running 
`terraform import aws_s3_bucket.example gnicaf9v3qe7gkqjh3vawd3xkoya8jw8`

```bash
╷
│ Error: Incompatible Terraform version
│ 
│ The local Terraform version (1.6.0) does not meet the version requirements for remote workspace
│ msaghu/terra-house-renaissance (~> 1.5.0).
│ 
│ If you're sure you want to upgrade the state, you can force Terraform to continue using the
│ -ignore-remote-version flag. This may result in an unusable workspace.
```

The results from ChatGPT suggested that I run :
    1. terraform version in the CLI which gave `Terraform v1.6.0`
    2. Then I changed the version of the remote workspace for `msaghu/terra-house-renaissance` manually by following the following steps as suggested by ChatGPT
    ```
    - If you are using Terraform Cloud , the remote workspace version is typically set in the workspace settings. Here are the steps to update it:
    
    a. Log in to your Terraform Cloud account.
    b. Navigate to the specific workspace i.e `msaghu/terra-house-renaissance` you want to update.
    c. Click on "Settings" .
    d. Look for a section or option that allows you to specify the Terraform version. This is usually called "Version Control".
    e. Update the version to the desired Terraform version. You can select it from a dropdown list if available.
    f. Save the changes"

2. After changing terraform state, this was the second error that i encountered when i again tried to run `terraform import aws_s3_bucket.example gnicaf9v3qe7gkqjh3vawd3xkoya8jw8`

```bash
╷
│ Error: Resource already managed by Terraform
│ 
│ Terraform is already managing a remote object for aws_s3_bucket.example. To import to this address you
│ must first remove the existing object from the state.
╵
```

The following are the steps that I followed:

    The error message you're encountering, "Resource already managed by Terraform," indicates that the AWS S3 bucket you are trying to import into your Terraform configuration is already being managed by another Terraform configuration or state file. In order to import the resource, you will need to first remove it from the existing Terraform state.

    Here's a step-by-step guide on how to resolve this issue:

    1. **Identify the Source of the Existing Terraform State**:

        You need to identify the Terraform configuration that is currently managing the AWS S3 bucket. This could be another Terraform project or configuration that was used to create the bucket. You will need access to this project to make the necessary changes.
        [When we say "Terraform configuration that is currently managing the AWS S3 bucket," we are referring to the specific Terraform project or set of Terraform configuration files that were used to create, manage, and provision the AWS S3 bucket in question.
    
        In the context of Terraform:

        Terraform Configuration: This refers to the set of .tf or .hcl files that define the infrastructure resources you want to create or manage using Terraform. These files contain resource definitions, variables, providers, and other configuration elements that describe how your infrastructure should look.

        Managing: When we say a Terraform configuration is "managing" a resource, it means that the resource was created or provisioned by Terraform using the instructions provided in that configuration. Terraform keeps track of the resource's state and can make updates or changes to the resource based on changes in the configuration.

        So, when we say that a Terraform configuration is "currently managing an AWS S3 bucket," it means that a particular set of Terraform configuration files was used to create and manage that S3 bucket. Terraform is aware of the bucket's existence, state, and configuration, and it's responsible for making changes to the bucket if the configuration changes.

        Identifying the Terraform configuration responsible for a resource is important if you want to update, modify, or import that resource into a different Terraform configuration or workspace. It involves finding the specific set of Terraform files and the corresponding Terraform state that contains information about that resource.

        ]

    2. **Remove the Resource from the Existing Terraform State**:

        In the project that is currently managing the S3 bucket, you should remove the resource from the Terraform state using the `terraform state rm` command. For example:

        ```bash
        terraform state rm aws_s3_bucket.example
        ```

        Replace `aws_s3_bucket.example` with the actual resource name that you want to import.

        After running this command, the resource will be removed from the existing state file, but it won't be deleted from AWS.

    3. **Import the Resource into Your New Terraform Configuration**:

        Once the resource has been removed from the existing Terraform state, you can import it into your new Terraform configuration. Use the `terraform import` command to do this:

   ```bash
   terraform import aws_s3_bucket.example <bucket_name>
   ```

   Replace `aws_s3_bucket.example` with your AWS S3 bucket resource name in your Terraform configuration, and `<bucket_name>` with the actual name of the S3 bucket you want to import.

