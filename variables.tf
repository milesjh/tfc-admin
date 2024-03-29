variable "vcs_azdo_oauth_client_id" {
  description = "OAuth Client ID associated with Azure DevOps Services VCS Integration (ex: oc-xxxxxxxxx)"
}
variable "vcs_github_oauth_token" {
  description = "Token String provided by GitHub for TFC VCS Config(ex. ghp_xxxxxxxxxxxxxx)"
}
variable "tfc_org" {
  description = "Target TFC Org for workspaces"
  default = "milesjh-sandbox"
}
variable "arm_client_id" {
  description = "Azure Client ID"
}
variable "arm_client_secret" {
  description = "Azure Client Secret"
}
variable "arm_tenant_id" {
  description = "Azure Tenant ID"
}
variable "arm_subscription_id" {
  description = "Azure Subscription ID"
}
variable "aws_access_key" {
  description = "AWS Access Key"
}
variable "aws_secret_key" {
  description = "AWS Secret Key"
}