variable "gke_name" {
  type = string
  description = ""
}

variable "location" {
  type = string
  description = "The GCP Region in which all resources in this example should be provisioned"
}

 variable "node_count" {
   type = string
   description = "The amount of nodes"
 }

variable "preemptible_nodes" {
  type = string
  description = "If your nodes are preemptible nodes (not for production)"
}

variable "machine_type_node" {
  type = string
  description = "Type of nodes"
}

variable "gke_version" {
  type = string
  description = "Kubernetes version"
}