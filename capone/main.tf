terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.12.0"
    }
  }
}

provider "google" {
  project     = "exalted-pattern-424313-j3"
  credentials = file("${path.module}/../exalted-pattern-424313-j3-41106fd4cb4e.json")
}

resource "google_compute_instance" "vm" {
  for_each = toset([for i in [1, 2, 3] : "capone${i}"])

  name         = each.value
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}