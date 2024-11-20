provider "google" {
  # Chemin vers les credentials JSON (utilise une variable d’environnement si possible)
  credentials = file("triple-kingdom-416610-cae26f77de65.json")
  project     = "triple-kingdom-416610" # Change avec ton ID projet
  region      = "europe-west1" # Région BigQuery
}

# Création d'un dataset BigQuery
resource "google_bigquery_dataset" "train_dataset" {
  dataset_id    = "train_dataset"
  location      = "europe-west1"
  friendly_name = "Training Dataset"
  description   = "Dataset for training purposes."
}

# Création d'une table BigQuery dans le dataset
resource "google_bigquery_table" "train_table" {
  dataset_id = google_bigquery_dataset.train_dataset.dataset_id
  table_id   = "fraud_transactions"
  project    = google_bigquery_dataset.train_dataset.project

  schema = jsonencode([
    {
      "name" : "transaction_id",
      "type" : "STRING",
      "mode" : "REQUIRED"
    },
    {
      "name" : "amount",
      "type" : "FLOAT",
      "mode" : "NULLABLE"
    },
    {
      "name" : "timestamp",
      "type" : "TIMESTAMP",
      "mode" : "NULLABLE"
    },
    {
      "name" : "is_fraud",
      "type" : "BOOLEAN",
      "mode" : "NULLABLE"
    }
  ])
}
