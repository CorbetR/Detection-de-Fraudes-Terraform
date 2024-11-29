resource "google_iam_workload_identity_pool" "github-actions-pool" {
  project = local.project_id
  workload_identity_pool_id = "github-actions-pool"
}

resource "google_iam_workload_identity_pool_provider" "github-actions-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.github-actions-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-provider"
  attribute_mapping                  = {
    "google.subject"       = "assertion.sub"
  }
  attribute_condition = <<EOT
    attribute.repository == "Luap989/Detection-de-fraudes"
EOT
  oidc {
    issuer_uri        = "https://token.actions.githubusercontent.com/"
  }
}