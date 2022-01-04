provider "google" {
  project = "iaac-terraform"
  region  = "europe-west6"
  zone    = "europe-west6-b"
}
resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "e2-micro"
  desired_status = "RUNNING"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}