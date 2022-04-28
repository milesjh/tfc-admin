locals {
  as_apps = toset(
    [
      "ace", 
      "bge", 
      "comed", 
      "dpl", 
      "peco", 
      "pepco"
    ]
  )
}

data "tfe_oauth_client" "azdo" {
  oauth_client_id = var.vcs_azdo_oauth_client_id
}

resource "tfe_oauth_client" "github" {
  name             = "GitHub"
  organization     = var.tfc_org
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.vcs_github_oauth_token
  service_provider = "github"
}

module "app_service_workspaces" {
  source  = "app.terraform.io/mjh-demo/workspace/tfe"
  version = "0.1.0"

  for_each = local.as_apps

  use_case_name          = each.key

  oauth_token_id         = data.tfe_oauth_client.github.oauth_token_id
  aws_access_key         = var.aws_access_key
  aws_secret_key         = var.aws_secret_key
  arm_client_id          = var.arm_client_id
  arm_client_secret      = var.arm_client_secret
  arm_tenant_id          = var.arm_tenant_id
  arm_subscription_id    = var.arm_subscription_id
  tfe_team_developers_id = tfe_team.developers.id
  tfe_team_ops_id        = tfe_team.ops.id
}