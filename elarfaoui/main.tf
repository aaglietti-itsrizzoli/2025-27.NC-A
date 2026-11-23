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
  zone    = "us-central1-a"
}

variable "vm_count" {
  description = "Numero di macchine virtuali Debian da creare"
  type        = number
  default     = 3

  validation {
    condition     = var.vm_count >= 1 && var.vm_count == floor(var.vm_count)
    error_message = "vm_count deve essere un numero intero maggiore o uguale a 1."
  }
}

data "google_compute_image" "debian_12" {
  project = "debian-cloud"
  family  = "debian-12"
}

resource "google_compute_instance" "pluto" {
  count        = var.vm_count
  name         = "elarfaoui-${count.index + 1}"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.debian_12.self_link
      #size  = 10
      #type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
  }
}