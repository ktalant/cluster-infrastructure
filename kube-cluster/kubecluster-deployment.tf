provider "google" {
  credentials   = "${file("${var.cpath}")}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.project}"
  region        = "${var.region}"
}
resource "google_container_cluster" "gke-cluster" {
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

    # The set of Google API scopes
    # The following scopes are necessary to ensure the correct functioning of the cluster
    # oauth_scopes = [
    #   "https://www.googleapis.com/auth/compute",
    #   "https://www.googleapis.com/auth/devstorage.read_only",
    #   "https://www.googleapis.com/auth/logging.write",
    #   "https://www.googleapis.com/auth/monitoring",
    # ]

    # Tags can used to identify targets in firewall rules
    # tags = ["${var.name}-cluster", "nodes"]
  }
}