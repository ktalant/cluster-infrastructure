resource "google_dns_managed_zone" "fuchicorp" {
  dns_name = "talantbek.net."
  name     = "fuchicorp"
  project  = "${var.google_project_id}"
}
