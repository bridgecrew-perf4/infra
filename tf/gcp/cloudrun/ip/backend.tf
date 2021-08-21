terraform {
  backend "gcs" {
    bucket = "skovati-tfstate"
    prefix = "cloudrun/curl-ip"
  }
}
