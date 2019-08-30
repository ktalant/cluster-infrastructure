variable "cluster_name" {
  default = "fuchicorp-cluster"
}

variable "node_count" {
  default = "2"
}

variable "google_project_id" {
  default = "universal-team-245120"
}

variable "service_account_path" {
  default = "./fuchicorp-service-account.json"
}

variable "region" {
  default = "us-central1"
}

variable "bucket_name" {
  default = "fuchicorp-bucket"
}
