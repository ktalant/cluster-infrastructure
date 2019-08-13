resource "google_compute_instance_template" "bastion" {
  name                = "${var.instance_name}"
  machine_type        = "${var.machine_type}"
  project             = "${var.project}"
  region              = "${var.region}"
  count               = "${var.count}"
  # name  = "${var.name_prefix}-${count.index}"

  // boot disk
  disk {
    source_image      = "CentOS 7"
  }
}