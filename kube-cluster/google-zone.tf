resource "google_dns_managed_zone" "fuchicorp" {
  dns_name = "spacextech.net."
  name     = "fuchicorp"
  project  = "${var.google_project_id}"
}
