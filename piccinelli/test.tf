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
  zone = "us-central1-a"
}

resource "google_compute_instance" "gordon" {
  name         = "piccinelli"
  machine_type = "e2-micro"

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
