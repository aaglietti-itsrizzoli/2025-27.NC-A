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
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_economica" {
  name         = "coppola"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {
      # Lascia vuoto per assegnare un indirizzo IP pubblico effimero
    }
  }
}