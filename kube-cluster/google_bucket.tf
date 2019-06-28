resource "google_storage_bucket" "fuchicorp_bucket" {
  name   = "fuchicorp-bucket"
  storage_class = "COLDLINE"
  location = "${var.region}"
}
