resource "google_storage_notification" "bucket_notification" {
  bucket       = google_storage_bucket.data_bucket.name
  topic        = google_pubsub_topic.gcs_topic.id
  event_types  = ["OBJECT_FINALIZE"]
  payload_format = "JSON_API_V1"
}

resource "google_storage_bucket" "data_bucket" {
  name          = "${local.project_id}-event-driven-bucket"
  location      = local.region
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 180
    }   
    action {
      type = "Delete"
    }
  }

  # Non neccessaire, permet juste d'attribué des caractéristiques à la ressource
  labels = {
    environment = "dev"
    team        = "data-engineering"
  }
}
