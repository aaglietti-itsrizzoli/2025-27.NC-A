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
}

resource "google_compute_instance" "pippo" {
  count        = var.instance_count # quante istanze verranno create
  name         = "padovani-${count.index + 1}" # nome con un prefisso e il count della vm
  machine_type = "e2-micro" # taglia meno costosa (2 vCPU condivise, 1 GB RAM)
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
