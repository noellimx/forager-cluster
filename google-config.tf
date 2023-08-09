data "google_client_config" "provider" {}

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}
