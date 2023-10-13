variable "user_uuid" {
  type        = string
  description = "User UUID in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

  validation {
    condition     = can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", var.user_uuid))
    error_message = "user_uuid must be in the format of a UUID (e.g., xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)"
  }
}

variable "bucket_name" {
  type        = string
  description = "AWS S3 bucket name"

  validation {
    condition     = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 && 
      can(regex("^[a-z0-9][a-z0-9-.]*[a-z0-9]$", var.bucket_name))
    )
    error_message = "The bucket name must be between 3 and 63 characters, start and end with a lowercase letter or number, and can contain only lowercase letters, numbers, hyphens, and dots."
  }
}

 #[Fileexists Teraform function](https://developer.hashicorp.com/terraform/language/functions/fileexists)
 variable "index_html_file_path" {
   type        = string
   description = "Path to the index.html file for your static website"
 
   validation {
     condition     = fileexists(var.index_html_file_path)
     error_message = "The specified index.html file does not exist. Please provide a valid file path."
   }
 }
 variable "error_html_file_path" {
   type        = string
   description = "Path to the error.html file for your static website"
 
   validation {
     condition     = fileexists(var.error_html_file_path)
     error_message = "The specified error.html file does not exist. Please provide a valid file path."
   }
 }
