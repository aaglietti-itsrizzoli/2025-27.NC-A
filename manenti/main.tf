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
  project = "exalted-pattern-424313-j3"
  #region  = "us-central1"
  zone = "us-central1-a"
}

# VM al costo minimo: e2-micro (rientra nel Free Tier in us-central1, us-west1, us-east1)
resource "google_compute_instance" "vm_debian" {
  name         = "vm-debian12"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12" # ultima immagine Debian 12 (bookworm)
      #size  = 10                       # GB, minimo per l'immagine
      #type  = "pd-standard"            # disco più economico (Free Tier fino a 30 GB)
    }
  }

  network_interface {
    network = "default"

    # Decommenta per avere un IP pubblico (ha un piccolo costo orario):
    # access_config {}
  }
}
