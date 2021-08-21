variable "image_url" {
  type = string
  description = "container image to run on cloudrun"
}

variable "project" {
  type = string
  description = "project to run in"
}

variable "region" {
  type = string
  description = "region to deploy cloud run instance in"
}
