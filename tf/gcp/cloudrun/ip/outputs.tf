output "url" {
  value = "${google_cloud_run_service.curl-ip.status[0].url}"
}
