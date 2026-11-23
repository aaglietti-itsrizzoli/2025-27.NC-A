terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.12.0"
    }
  }
}

provider "google" {
  credentials = file("exalted-pattern-424313-j3-41106fd4cb4e.json")
  project     = "exalted-pattern-424313-j3"
  region      = "europe-west1"
  zone        = "europe-west1-b"
}

variable "vm_count" {
  type    = number
  default = 5
}

resource "google_compute_instance" "vm_pavone" {
  count        = var.vm_count
  name         = "vm-pavone-${count.index + 1}"
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