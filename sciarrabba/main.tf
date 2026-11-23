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
 # region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_minima" {
  name         = "sciarrabba"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
     # size  = 10            # GB, il minimo per l'immagine Debian 12
     # type  = "pd-standard" # il tipo di disco più economico
    }
  }

  network_interface {
    network = "default"
  }
}