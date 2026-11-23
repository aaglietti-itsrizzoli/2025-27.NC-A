terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.11.0"
    }
  }
}

variable "numero_vm" {
  description = "Quante VM Debian 12 creare"
  type        = number
  default     = 5
}

provider "google" {
  project = "exalted-pattern-424313-j3"
 # region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_minima" {
  count        = var.numero_vm
  name         = "vm-sciarrabba-${count.index + 1}"
  machine_type = "e2-micro"
  zone    = "us-central1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
   #   size  = 10
    #  type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}