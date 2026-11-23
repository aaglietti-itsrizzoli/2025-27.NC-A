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

variable "instance_count" {
  description = "Numero di istanze VM da creare"
  type        = number
  default     = 3

  validation {
    condition     = var.instance_count >= 1
    error_message = "instance_count deve essere almeno 1."
  }
}

resource "google_compute_instance" "pippo" {
  count        = var.instance_count
  name         = "wan-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "europe-west1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"
  }
}
