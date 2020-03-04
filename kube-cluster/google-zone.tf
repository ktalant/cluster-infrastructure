resource "google_dns_managed_zone" "fuchicorp" {
  dns_name = "talant.guru."
  name     = "fuchicorp"
  project  = "${var.google_project_id}"
}
