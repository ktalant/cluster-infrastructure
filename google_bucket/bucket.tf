provider "google" {
  credentials   = "${file("${var.cpath}")}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.project}"
  region        = "${var.region}"
}

resource "google_storage_bucket" "COLDLINE" {
  name   = "fuchicorp"
  storage_class = "COLDLINE" 
  location = "us-east1"
}