terraform {
  backend "gcs" {
    bucket  = "skovati-tfstate"
  }
}
