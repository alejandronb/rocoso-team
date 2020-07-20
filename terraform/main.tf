resource "google_container_cluster" "primary" {
  name     = var.gke_name
  location = var.location
  min_master_version  = var.gke_version
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.gke_name
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count
  version    = var.gke_version
  node_config {
    preemptible  = var.preemptible_nodes
    machine_type = var.machine_type_node

    metadata = {
      disable-legacy-endpoints = "true"
    }

    # oauth_scopes = [
    #   "https://www.googleapis.com/auth/logging.write",
    #   "https://www.googleapis.com/auth/monitoring",
    # ]
  }
}
