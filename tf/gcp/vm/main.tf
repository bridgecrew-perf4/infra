# google provider
provider "google" {
  project = var.project
  region  = var.region
}

# random id 
resource "random_id" "instance_id" {
  byte_length = 2
}

# static ip
resource "google_compute_address" "static_ip" {
  name = "static-vm-ip"
}

# firewall that allows http
resource "google_compute_firewall" "http" {
  name    = "http-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  target_tags = ["web-server"]
}

# vm
resource "google_compute_instance" "vm" {
  name         = format("%s%s", var.name, random_id.instance_id.hex)
  machine_type = var.machine_type
  zone         = var.zone

  tags = ["web-server"]

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  metadata_startup_script = file("start.sh")

  metadata = {
    ssh-keys = var.ssh
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
