variable "instance_name" {
  default = "bastion-fuchicorp-example"
}

variable "project" {
  default = "fuchicorp-project-256020"
}

variable "zone" {
  default = "us-central1-a"
}

variable "machine_type" {
  default = "f1-micro"
}

variable "git_common_token" {
  default = "ad9015cdfda2935a25cae144d9bf1ede5b731196"
}

variable "gce_ssh_private_key_file" {
  default = "./fuchicorp-service-account.json"
}
