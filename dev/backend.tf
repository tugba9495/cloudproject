terraform{
    backend "s3" {
        bucket = "cloudproject-2024"
        key = "prod/terraform.tfstate"
        region = "us-west-1"
      
    }

}