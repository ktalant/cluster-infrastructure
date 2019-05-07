provider "google" {
  credentials   = "${file("${var.cpath}")}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.project}"
  region        = "${var.region}"
}
resource "google_container_cluster" "cluster-fuchicorp-com" {
    name                = "${var.cluster_name}"
    network             = "default"
    subnetwork          = "default"
    zone                = "us-central1-a"
    min_master_version  = "1.11.8-gke.6"
    initial_node_count  = "${var.initial_node_count}"

    node_config {
      # image_type   = "${var.node_image_type}"
      machine_type      = "n1-standard-2"
      # disk_size_gb = "${var.node_disk_size_gb}"
  }
}