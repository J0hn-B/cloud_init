#*------------------------------------------------
#*   Google Cloud --Create Service Account
#*------------------------------------------------ 

resource "google_service_account" "k8s_multi" {
  account_id   = var.service_account_id
  display_name = var.service_account_display_name
  project      = data.google_project.project.project_id
}
