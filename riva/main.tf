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

# 1. Variabile per definire il numero di VM
variable "numero_vm" {
  description = "Numero di istanze VM da creare"
  type        = number
  
}

# 2. Risorsa con iterazione (count)
resource "google_compute_instance" "pippo" {
  count        = var.numero_vm
  name         = "riva-${count.index}"
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