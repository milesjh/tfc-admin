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

module "azdo_app_service_workspaces" {
  source  = "app.terraform.io/milesjh-sandbox/workspace-azdo/tfe"
  version = "0.1.0"

  for_each = local.as_apps

  use_case_name          = each.key
  oauth_token_id         = data.tfe_oauth_client.azdo.oauth_token_id
  tfe_team_developers_id = tfe_team.developers.id
  tfe_team_ops_id        = tfe_team.ops.id
}

module "gh_app_service_workspaces" {
  source  = "app.terraform.io/milesjh-sandbox/workspace-gh/tfe"
  version = "0.1.0"

  for_each = local.as_apps

  use_case_name          = each.key
  oauth_token_id         = tfe_oauth_client.github.oauth_token_id
  tfe_team_developers_id = tfe_team.developers.id
  tfe_team_ops_id        = tfe_team.ops.id
}