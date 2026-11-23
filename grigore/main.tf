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

variable "numero_vm" {
  description = "Numero di macchine virtuali da creare"
  type        = number
  default     = 3
}

variable "prefisso" {
  description = "Prefisso del nome delle VM"
  type        = string
  default     = "grigore"
}

locals {
  nomi_vm = [for i in range(1, var.numero_vm + 1) : "${var.prefisso}-${i}"]
}

resource "google_compute_instance" "vm" {
  for_each = toset(local.nomi_vm)

  name         = each.value
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

output "macchine_create" {
  value = {
    for nome, vm in google_compute_instance.vm :
    nome => vm.network_interface[0].network_ip
  }
}