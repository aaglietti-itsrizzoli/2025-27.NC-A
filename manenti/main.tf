terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.12.0"
    }
  }
}


provider "google" {
  # Configuration options
  project     = "exalted-pattern-424313-j3"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = file("../exalted-pattern-424313-j3-41106fd4cb4e.json")
}

# Cambia solo questo numero per creare più o meno VM identiche
variable "vm_count" {
  type    = number
  default = 4
}

resource "google_compute_instance" "vm_debian" {
  count        = var.vm_count
  name         = "manenti-${count.index + 1}" # vm-debian12-1, -2, -3, ...
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"

    # Decommenta per avere un IP pubblico (ha un piccolo costo orario):
    # access_config {}
  }
}
