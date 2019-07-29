resource "google_storage_bucket" "fuchicorp_bucket" {
  name   = "${var.bucket_name}"
  storage_class = "COLDLINE"
  location = "${var.region}"
}
