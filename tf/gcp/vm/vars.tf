variable "project" {
  type = string
  description = "Project ID within GCP"
}

variable "region" {
  type = string
  description = "region to spin up in"
}

variable "zone" {
  type = string
  description = "zone to spin up in"
}

variable "machine_type" {
  type = string
  description = "machine type to spin up"
}

variable "name" {
  type = string
  description = "name for vm"
}

variable "image" {
  type = string
  description = "image to be installed to disk"
}

variable "metadata_startup_script" {
  type = string
  description = "script that will run on first boot"
}

variable "ssh" {
  type = string
  description = "ssh public key to add to vm"
}
