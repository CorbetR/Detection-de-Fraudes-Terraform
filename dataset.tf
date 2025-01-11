resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = "transactions_dataset"   # Name of your dataset, change "fraud_detection" to whatever fits your use case.
  project    = local.project_id    # Dynamically assigns the project ID from the `local` block.
  location   = local.region                # Specifies that the dataset will be created in the European region.
}