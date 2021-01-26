#*------------------------------------------------
#*   Google Compute Engine --Create Instance 01
#*------------------------------------------------

resource "google_compute_instance" "k8s_multi_01" {
  name         = var.compute_instance_name
  machine_type = "g1-small"
  zone         = "europe-west2-a"

  tags = ["environment", "development"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    # access_config {
    #   // Ephemeral IP
    # }
  }

  metadata_startup_script = file("../scripts/cloud-init.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.k8s_multi.email
    scopes = ["cloud-platform"]
  }
}
