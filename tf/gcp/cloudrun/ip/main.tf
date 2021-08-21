# main cloud run instance
resource "google_cloud_run_service" "curl-ip" {
  name     = "curl-ip"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "ghcr.io/skovati/curl-ip"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run]
}

# enable cloud run api
resource "google_project_service" "run" {
  service = "run.googleapis.com"
}

# allow all users to hit endpoint
resource "google_cloud_run_service_iam_member" "allUsers" {
  service  = google_cloud_run_service.curl-ip.name
  location = google_cloud_run_service.curl-ip.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
