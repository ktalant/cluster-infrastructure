resource "google_compute_instance_template" "bastion" {
  name_prefix  = "bastion"
  machine_type = "n1-standard-1"
  region       = "us-central1"

  // boot disk
  disk {
    source_image = "CentOS 7"
  }
}