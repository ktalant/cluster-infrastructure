provider "google" {
  project             = "${var.project}"
  region              = "${var.region}"
  zone                = "${var.zone}"
}
resource "google_compute_instance_template" "vm_instance" {
  name                = "${var.instance_name}"
  machine_type        = "${var.machine_type}"
  
  
  count               = "${var.count}"
  # name  = "${var.name_prefix}-${count.index}"
 

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}