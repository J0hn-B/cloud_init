#*------------------------------------------------
#*   Google Cloud --Create Service Account
#*------------------------------------------------ 

resource "google_service_account" "k8s_multi" {
  account_id   = "k3s-multi-config-account"
  display_name = "GitOps-Account"
  project      = data.google_project.project.project_id
}
