resource "google_dns_managed_zone" "talantzon" {
  dns_name = "talantbek.com."
  name     = "talantzon"
  project  = "${var.google_project_id}"
}
