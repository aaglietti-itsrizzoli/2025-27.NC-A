terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.12.0"
    }
  }
}

provider "google" {
  project = "exalted-pattern-424313-j3"
}

resource "google_compute_instance" "debian12" {
  name         = "capone"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      #  size  = 10
      #  type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
  }
}