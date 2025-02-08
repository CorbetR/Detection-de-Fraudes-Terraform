output "cloud_run_endpoint" {
  value = "https://cloud-run-test-497650107059.us-central1.run.app"
}

output "cloud_run_service_account_email" {
  value = google_service_account.github_action_deploy.email
}

output "bucket_name" {
  value = google_storage_bucket.data_bucket.name
}
