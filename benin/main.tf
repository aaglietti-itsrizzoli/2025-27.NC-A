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
}

variable "vm_count" {
  description = "Numero di macchine virtuali da creare"
  type        = number
  default     = 5
}

resource "google_compute_instance" "pippo" {
  for_each     = toset([for i in range(var.vm_count) : tostring(i + 1)])
  name         = "benin-vm-${each.key}"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}