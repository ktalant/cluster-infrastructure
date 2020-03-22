variable "cluster_name" {
  default = "spacextech-cluster"
}

variable "node_count" {
  default = "3"
}

variable "google_project_id" {
  default = "talantzon"
}

variable "service_account_path" {
  default = "./google-service-account.json"
}

variable "region" {
  default = "us-central1"
}

variable "google_bucket_name" {
  default = "fuchicorp-bucket"
}

variable "cluster_version" {
  default = "1.13.11-gke.9"
}
