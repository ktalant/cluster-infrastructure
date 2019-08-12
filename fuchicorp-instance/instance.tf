data "google_compute_image" "bastion-tf" {
  family  = "centos-7"
  project = "fuchicorp"
}

resource "google_compute_instance_template" "bastion-tf" {
  name_prefix  = "instance-template-"
  machine_type = "n1-standard-1"
  region       = "us-central1"

  // boot disk
  disk {
    source_image = "${centos-cloud/centos-7}"
  }
}