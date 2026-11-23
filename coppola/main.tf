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

# Cambia questo numero per decidere quante macchine creare
variable "numero_macchine" {
  type    = number
  default = 3
}

resource "google_compute_instance" "vm_economica" {
  count        = var.numero_macchine
  name         = "coppola-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "us-central1-b"

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