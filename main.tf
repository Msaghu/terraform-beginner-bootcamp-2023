terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #  cloud {
  #    organization = "msaghu"
  #    workspaces {
  #      name = "terra-house-renaissance"
  #    }
  #  }
}

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
  
}
# module "terrahouse_aws" {
#   source      = "./modules/terrahouse_aws"
#   user_uuid   = var.user_uuid
#   bucket_name = var.bucket_name
#   index_html_file_path = var.index_html_file_path
#   error_html_file_path = var.error_html_file_path
#   content_version = var.content_version
# }

resource "terratowns_home" "home" {
  name = "Why the Rennaissance is the Tour of the decade!!!"
  description = <<DESCRIPTION
  I want to share my favourite momenst from the Renissance Tour. from the set list to the fabulous outfits.
  As one reporter put it 'A silver shimering summer of Beyonce'
  DESCRIPTION
  domain_name = "hhggsjkfjks.cloudfront.net" 
  town = "melomaniac-mansion"
  content_version = 1
}