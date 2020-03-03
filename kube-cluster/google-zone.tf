resource "google_dns_managed_zone" "talantzon" {
  name     = "talantzon1"
  dns_name = "talantzon.com."
  project  = "${var.google_project_id}"
}
