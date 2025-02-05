resource "google_pubsub_subscription" "push_subscription" {
  name  = "push-to-cloud-run"
  topic = google_pubsub_topic.gcs_topic.id

  # Configuration pour envoyer les messages à Cloud Run
  push_config {
    push_endpoint = "https://cloud-run-test-497650107059.us-central1.run.app" 

    # Authentification via un Service Account
    oidc_token {
      service_account_email = google_service_account.github_action_deploy.email
    }
  }
}

