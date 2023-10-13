terraform {
  cloud {
    organization = "msaghu"
    workspaces {
      name = "terraform-cloud"
    }
  }
}

module "terrahouse_aws" {
  source      = "./modules/terrahouse_aws"
  user_uuid   = var.user_uuid
  bucket_name = var.bucket_names
#   index_html_file_path = var.index_html_file_path
#   error_html_file_path = var.error_html_file_path
 }