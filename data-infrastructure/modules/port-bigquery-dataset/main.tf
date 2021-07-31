resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = "${var.data_product_name}_${var.dataset_name}"
  location                    = var.location
  default_table_expiration_ms = 3600000
  default_partition_expiration_ms = 5184000000
  delete_contents_on_destroy = true

  access {
    role          = "OWNER"
    user_by_email = var.owner_email
  }

  # TODO Refactor this such that dataset-dp-a has a role binding to access group dp-a-consumers, such that data product b
  access {
    role = "READER"
    user_by_email = var.consumer_email
  }
}