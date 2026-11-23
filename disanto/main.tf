terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.12.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = "exalted-pattern-424313-j3"
  credentials = file("${path.module}/../exalted-pattern-424313-j3-41106fd4cb4e.json")
}

resource "google_compute_instance" "debian12" {
  for_each = toset([for i in range(1, 6) : "disanto-vm-${i}"])

  name         = each.value
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/family/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}