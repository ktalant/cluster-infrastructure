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

    // Use an existing disk resource
  disk {
    // Instance Templates reference disks by name, not self link
    source      = "${google_compute_disk.bastion.name}"
    auto_delete = false
    boot        = false
  }
 

  network_interface {
    # A default network is created for all GCP projects
    network       = "default"
    access_config {
    }
  }
}