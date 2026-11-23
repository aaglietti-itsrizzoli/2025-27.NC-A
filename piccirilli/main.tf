provider "google" {
  # Configuration options
  project = "exalted-pattern-424313-j3"
}


locals {
  n = 1
  vm_indices = {
    for i in range(local.n) : tostring(i) => i
  }
}


moved {
  from = google_compute_instance.debian12
  to   = google_compute_instance.debian12["0"]
}


resource "google_compute_instance" "debian12" {
  for_each     = local.vm_indices
  name         = each.value == 0 ? "piccirilli" : "piccirilli-${each.value + 1}"
  machine_type = "e2-micro"
  zone         = "us-west1-a"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      #size  = 10
      #type  = "pd-standard"
    }
  }


  network_interface {
    network = "default"
  }
}