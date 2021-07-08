# gcp vars
project = "cloud-317800"
zone = "us-central1-a"
region = "us-central1"

# vm vars
machine_type = "f1-micro"
image = "debian-cloud/debian-10"
metadata_startup_script = "sudo apt update;echo hi > /test.txt"
name = "tfvm"
ssh = "skovati:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM9t+S5yg+5ASAYxB7kYNPcySKit9uucYgOeRX0aWgzK skovati@station"
