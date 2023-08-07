provider "helm" {
  kubernetes {
    host  = "https://${google_container_cluster.primary.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.primary.master_auth[0].cluster_ca_certificate
    )
  }
  experiments {
    manifest = true
  }
}


variable "forager_helm_chart_version" {
  description = "Chart version"
  nullable    = false
}

variable "nginx_version" {
  description = "nginx version"
  nullable    = false
}
resource "helm_release" "forager-helm" {
  name             = "forager-helm-1"
  chart            = "forager-helm"
  repository       = "https://noellimx.github.io/forager-helm"
  namespace        = "forager-helm"
  max_history      = 3
  create_namespace = true
  wait             = true
  reset_values     = true
  version          = var.forager_helm_chart_version


  force_update = true

  set {
    name  = "nginxVersion"
    value = var.nginx_version
  }
}
