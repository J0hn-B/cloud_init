#*------------------------------------------------
#*   Terraform --Provider --Backend    
#*------------------------------------------------

## No organization configuration.
#! gcloud auth application-default login
#!  gcloud auth login


data "google_project" "project" {}

output "project" {
  value = data.google_project.project.project_id
}


provider "google" {
  project = "k3s-project-302412" #FIXME Update the value if new project
  region  = "europe-west2"
}
