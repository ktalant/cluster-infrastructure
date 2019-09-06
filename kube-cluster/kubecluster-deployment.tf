provider "google" {
  credentials   = "${file("./fuchicorp-service-account.json")}"   #GOOGLE_CREDENTIALS to the path of a file containing the credential JSON
  project       = "${var.google_project_id}"
}
resource "google_container_cluster" "cluster_fuchicorp_com" {
    name                = "${var.cluster_name}"
    network             = "default"
    subnetwork          = "default"
    zone                = "us-central1-a"
    min_master_version  = "1.12.8-gke.10"
    initial_node_count  = "${var.node_count}"
    project             = "${var.google_project_id}"

    node_config {
      machine_type      = "n1-standard-1"
  }
resource "google_compute_instance" "bastion" {
    name = "bastion"
    zone = "us-central1-a"
    machine_type = "n1-standard-1"

    boot_disk {
    initialize_params {
      image = "CentOS7"
      }
    }

    network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
      }
    }

  provisioner "remote-exec" {
    inline = [
      "curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-261.0.0-linux-x86_64.tar.gz",
      "tar zxvf google-cloud-sdk-261.0.0-linux-x86_64.tar.gz google-cloud-sdk",
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "wget https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip",
      "unzip -o terraform_0.12.7_linux_amd64.zip",
      "sudo mv terraform /bin"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl",
      "curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl",
      "chmod +x ./kubectl",
      "sudo mv ./kubectl /usr/local/bin/kubectl"
    ]
  }
  provisioner "remote-exec" {
    inline = [
      "https://get.helm.sh/helm-v3.0.0-beta.3-linux-amd64.tar.gz",
      "tar -zxvf helm-v2.0.0-linux-amd64.tgz",
      "mv linux-amd64/helm /usr/local/bin/helm"
      ]
  }
}
