provider "google" {
  project = local.project_id
  region  = "europe-west1"
}

terraform {
  backend "gcs" {
    bucket  = "retailfrauddetectionai-tf-state"
    prefix  = "terraform/state"
  }
}
