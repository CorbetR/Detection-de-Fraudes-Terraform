provider "google" {
  project = "retailfrauddetectionai"  # Replace with your GCP project ID
  region  = "europe-west1"           # Replace with your preferred region
}

resource "google_storage_bucket" "data_bucket" {
  name          = "${var.project_id}-daily-data-bucket"  # Globally unique bucket name
  location      = "europe-west1"                        # Matches the provider's region
  force_destroy = true                                  # Set to true to delete non-empty buckets

  lifecycle_rule {
    condition {
      age = 30                                           # Retain objects for 30 days
    }
    action {
      type = "Delete"
    }
  }

  labels = {
    environment = "dev"
    team        = "data-engineering"
  }
}

variable "project_id" {
  default = "retailfrauddetectionai"  
  description = "The GCP project ID"
}
