remote_state {
  backend = "s3"
  config = {
    bucket = "msteen-terraform-state"
    region = "us-east-1"
    key    = "${path_relative_to_include()}/terraform.tfstate"
    profile = "sandbox"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region = "us-east-1"
  profile = "sandbox"
}
EOF
}