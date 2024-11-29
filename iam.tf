resource "google_service_account_iam_member" "github-action-SA-workloadIdentityUser" {
  service_account_id = google_service_account.github_action_deploy.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/projects/497650107059/locations/global/workloadIdentityPools/github-actions-pool/subject/Pillouhabsom"
}

resource "google_project_iam_member" "github-actions-project-owner" {
  project = local.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}