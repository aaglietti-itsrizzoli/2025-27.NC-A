terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0.0"
    }
  }
}

provider "google" {
  credentials = file("exalted-pattern-424313-j3-41106fd4cb4e.json")
  project     = "exalted-pattern-424313-j3"
  region      = "us-central1"
  zone        = "us-central1-b"
}

resource "google_compute_instance" "vm" {
  name         = "pavone"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}
