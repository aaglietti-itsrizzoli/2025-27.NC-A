terraform {
  required_version = ">= 1.1.0"

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

variable "numero_macchine" {
  type    = number
  default = 3
}

moved {
  from = google_compute_instance.pippo
  to   = google_compute_instance.pippo["perrone"]
}

resource "google_compute_instance" "pippo" {
  for_each = toset([
    for i in range(var.numero_macchine) :
    i == 0 ? "perrone" : "perrone-${i + 1}"
  ])

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
  }
}
