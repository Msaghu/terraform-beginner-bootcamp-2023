# Terraform Beginner Bootcamp 2023

![268042721-ab015431-2d14-4910-aa37-be4807b2b905](https://github.com/Msaghu/terraform-beginner-bootcamp-2023/assets/77676513/e47381c9-ed08-4f24-9e84-77b78a42d107)

## Weekly Journals
- [Week 0 Journal](journal/week0.md)
- [Week 1 Journal](journal/week1.md)

## Resources
- [Githb markdown TOC generator](https://derlin.github.io/bitdowntoc/)

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

