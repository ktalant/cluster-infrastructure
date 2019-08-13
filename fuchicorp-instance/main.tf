resource "google_compute_instance_template" "bastion" {
  name                = "${var.instance_name}"
  machine_type        = "${var.machine_type}"
  project             = "${var.project}"
  count               = "${var.count}"
  # name  = "${var.name_prefix}-${count.index}"

data "google_compute_zones" "available" {
  region = "${var.region}"
  status = "UP"
}

  // boot disk
  disk {
    source_image      = "CentOS 7"
  }
}