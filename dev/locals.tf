locals {
    region              = "us-west-1"
    stage               = "dev"
    project             = "cloudproject"
    name                = "terraform-${local.stage}-${local.region}-${local.project}-rtype-${var.env}"
     
    common_tags         = {
        env             = var.env
        project         = local.project
        team            = "devops"
        owner           = "tuba_7655@icloud.com"
        managed_by      = "terraform"
    }

  
}