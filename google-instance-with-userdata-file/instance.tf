resource "google_compute_instance" "centos7" {
  name         = "centos7"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "CentOS7"
      size = 10
      type = "pd-standard"
    }
  }
  metadata_startup_script = "${file("userdata.sh")}"
}