variable "instance_name" {
  default = "bastion-tf"
}

variable "count" {
  default = "1"
}

variable "project" {
  default = "k8-cluster3"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"  
}

variable "machine_type" {
    default = "f1-micro"  
}

