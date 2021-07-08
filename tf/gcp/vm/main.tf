# google provider
provider "google" {
  project = var.project
  region  = var.region
}

# random id 
resource "random_id" "instance_id" {
  byte_length = 2
}

# vm
resource "google_compute_instance" "default" {
  name         = format("%s%s", var.name, random_id.instance_id.hex)
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata_startup_script = var.metadata_startup_script

  metadata = {
    ssh-keys = var.ssh
  }

  network_interface {
    network = "default"

    # ephemeral ip
    access_config {
    }
  }
}
