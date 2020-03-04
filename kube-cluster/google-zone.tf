resource "google_dns_managed_zone" "talantzon" {
  name     = "talantzon"
  project  = "${var.google_project_id}"
}
