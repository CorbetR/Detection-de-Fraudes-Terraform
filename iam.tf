resource "google_service_account_iam_member" "github-action-SA-workloadIdentityUser" {
  service_account_id = google_service_account.github_action_deploy.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/projects/497650107059/locations/global/workloadIdentityPools/github-actions-pool/subject/Luap989"
}
# Permission pour CorbetR
resource "google_service_account_iam_member" "github-action-SA-workloadIdentityUser-corbetR" {
  service_account_id = google_service_account.github_action_deploy.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principal://iam.googleapis.com/projects/497650107059/locations/global/workloadIdentityPools/github-actions-pool/subject/CorbetR"
}

resource "google_project_iam_member" "github-actions-project-owner" {
  project = local.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}

resource "google_pubsub_topic_iam_member" "gcs_topic_publisher" {
  topic  = google_pubsub_topic.gcs_topic.id
  role   = "roles/pubsub.publisher"
  member = "serviceAccount:service-497650107059@gs-project-accounts.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "github-actions-artifact-registry-admin" {
  project = local.project_id
  role    = "roles/artifactregistry.admin"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}

resource "google_project_iam_member" "github-actions-cloud-run-admin" {
  project = local.project_id
  role    = "roles/run.admin"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}

resource "google_project_iam_member" "github-actions-storage-object-viewer" {
  project = local.project_id
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}

resource "google_project_iam_member" "github-actions-bq-editor" {
  project = local.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.github_action_deploy.email}"
}

resource "google_project_iam_member" "github-actions-token-creator" {
  project = "retailfrauddetectionai"
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:github-action-deploy@retailfrauddetectionai.iam.gserviceaccount.com"
}

resource "google_pubsub_topic" "gcs_topic" {
  name = "gcs-event-topic"
}