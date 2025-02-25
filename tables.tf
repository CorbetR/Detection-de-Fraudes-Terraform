resource "google_bigquery_table" "daily_partitioned_table" {
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  table_id   = "transactions_partitioned"
  project    = google_bigquery_dataset.my_dataset.project

  schema = <<EOF
[
  {
    "name": "client_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "transaction_id",
    "type": "STRING",
    "mode": "NULLABLE"
  },
  {
    "name": "purchase_date",
    "type": "DATE",
    "mode": "NULLABLE"
  },
  {
    "name": "paid_with_credit_card",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "paid_with_gift_card",
    "type": "BOOLEAN",
    "mode": "NULLABLE"
  },
  {
    "name": "gift_card_purchase_date",
    "type": "DATE",
    "mode": "NULLABLE"
  },
  {
    "name": "nb_gift_card_used",
    "type": "INTEGER",
    "mode": "NULLABLE"
  }
]
EOF

  time_partitioning {
    type         = "DAY"
    field        = "purchase_date"
    # On peut definir une regle de data lifetime via expiration_ms = xxxx    
  }
}
