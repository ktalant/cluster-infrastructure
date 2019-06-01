resource "google_storage_bucket" "fuchicorp_bucket" {
  name   = "fuchicorp"
  storage_class = "COLDLINE"
  location = "us-east1"
}
