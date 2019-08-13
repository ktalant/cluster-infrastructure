variable "instance_name" {
  default = "bastion-tf"
}

variable "count" {
  default = "1"
}

variable "project" {
  default = "universal-team-245120"
}

variable "service_account_path" {
  default = "./fuchicorp-service-account.json"
}

variable "region" {
  default = "us-central1"
}

variable "machine_type" {
    default = "n1-standard-1"  
}

