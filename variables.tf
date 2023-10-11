variable "user_uuid" {
    type = string
}

variable "bucket_name" {
    type = string
}

#[Fileexists Teraform function](https://developer.hashicorp.com/terraform/language/functions/fileexists)
variable "index_html_file_path" {
  type        = string
}

variable "error_html_file_path" {
  type        = string
}

variable "content_version" {
  type        = number
  description = "Content version number (positive integer starting at 1)"
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string 
  
}