
resource "google_service_account" "github_action_deploy" {
  account_id   = "github-action-deploy"
  display_name = "github-action-deploy"
  project      = local.project_id
}



