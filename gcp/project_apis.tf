#*------------------------------------------------
#*   Google Cloud Platform --Enable API
#*------------------------------------------------

resource "google_project_service" "project_cloudbilling" {
  service            = "cloudbilling.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "project_cloudresourcemanager" {
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "project_compute" {
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "gke" {
  service            = "container.googleapis.com"
  disable_on_destroy = false
}
