resource "tfe_organization_membership" "developer" {
  organization = var.tfc_org
  email        = "harrison.milesj+developer@gmail.com"
}

resource "tfe_team" "developers" {
  name         = "developers"
  organization = var.tfc_org
}

resource "tfe_team_organization_member" "developer" {
  team_id                    = tfe_team.developers.id
  organization_membership_id = tfe_organization_membership.developer.id
}

resource "tfe_organization_membership" "ops" {
  organization = var.tfc_org
  email        = "harrison.milesj+operator@gmail.com"
}

resource "tfe_team" "ops" {
  name         = "ops"
  organization = var.tfc_org
}

resource "tfe_team_organization_member" "operator" {
  team_id                    = tfe_team.ops.id
  organization_membership_id = tfe_organization_membership.ops.id
}