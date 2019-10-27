terraform {
  backend "gcs" {
    bucket  = "fuchicorp-bucket"
    prefix  = "tools/bastion"
    project = "fuchicorp-project-256020"
  }
}
