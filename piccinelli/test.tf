terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}

provider "google" {
  project = "exalted-pattern-424313-j3"
  #region  = "us-central1"
}

resource "google_compute_instance" "gordon" {
  for_each = toset([for i in range(5) : "piccinelli-${i + 1}"])

  name         = each.key
  machine_type = "e2-micro"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
    #access_config {} # IP pubblico effimero; rimuovi il blocco se non serve
  }
}