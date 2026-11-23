terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "exalted-pattern-424313-j3"
}

resource "google_compute_instance" "pippo" {
  name         = "padovani"
  machine_type = "e2-micro" # taglia meno costosa (2 vCPU condivise, 1 GB RAM)
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}
