provider "google" {
  credentials = "${file("./fuchicorp-service-account.json")}"
  project     = "${var.project}"
  zone        = "${var.zone}"
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  machine_type = "${var.machine_type}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network       = "default"
    access_config = {}
  }

  metadata_startup_script = <<EOF
  #!/bin/bash
  echo 'export GIT_TOKEN="${var.git_common_token}"' >> ~/.bashrc
  yum install python-pip git jq wget unzip vim centos-release-scl scl-utils-build -y
  yum install  python33 gcc python3 -y

  if [ ! -d "/common_scripts" 2>/dev/null ]; then
    git clone -b master https://github.com/fuchicorp/common_scripts.git "$HOME/common_scripts"
  fi

  cd  "/common_scripts/bastion-scripts/"
  python3 -m pip install -r "/common_scripts/bastion-scripts/requirements.txt"
  cd /common_scripts/bastion-scripts/ && python3 sync-users.py


  echo "* * * * * cd /common_scripts/bastion-scripts/ && python3 sync-users.py" >> /sync-crontab
  crontab /sync-crontab


  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
  mv kubectl /usr/bin
  chmod +x /usr/bin/kubectl

  wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip
  unzip  terraform_0.11.7_linux_amd64.zip
  mv terraform /usr/bin
  chmod +x /usr/bin/terraform

  wget https://get.helm.sh/helm-v2.11.0-linux-amd64.tar.gz
  tar -xvzf helm-v2.11.0-linux-amd64.tar.gz
  mv linux-amd64/helm /usr/bin/helm

  curl https://sdk.cloud.google.com | bash && exec -l $SHELL

EOF
}
