resource "tfe_variable_set" "cloud-creds" {
  name         = "Cloud-Creds"
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.tfc_org
}

resource "tfe_variable" "aws_access_key" {
  key          = "AWS_ACCESS_KEY_ID"
  value        = var.aws_access_key
  category     = "env"
  variable_set_id = tfe_variable_set.cloud-creds.id
}

resource "tfe_variable" "aws_secret_key" {
  key          = "AWS_SECRET_ACCESS_KEY"
  value        = var.aws_secret_key
  category     = "env"
  sensitive    = "true"
  variable_set_id = tfe_variable_set.cloud-creds.id
}

resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  variable_set_id = tfe_variable_set.cloud-creds.id
}

resource "tfe_variable" "arm_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_subscription_id
  category     = "env"
  variable_set_id = tfe_variable_set.cloud-creds.id
}

resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  variable_set_id = tfe_variable_set.cloud-creds.id
}

resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  sensitive    = "true"
  variable_set_id = tfe_variable_set.cloud-creds.id
}