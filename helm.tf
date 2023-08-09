provider "helm" {
  kubernetes {
    host  = "https://${google_container_cluster.primary.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.primary.master_auth[0].cluster_ca_certificate
    )
  }
}

variable "forager_helm_chart_version" {
  description = "Chart version"
  nullable    = false
}

variable "forager_helm_chart_repo" {
  description = "Chart version"
  nullable    = false
}

variable "nginx_version" {
  description = "nginx version"
  nullable    = false
}

resource "argocd_application" "helm" {
  metadata {
    name      = "forager-helm-1"
    namespace = "argocd"
  }

  wait = true

  spec {
    source {
      repo_url        = var.forager_helm_chart_repo
      chart           = "forager-helm"
      target_revision = var.forager_helm_chart_version
      helm {
        parameter {
          name  = "nginxVersion"
          value = var.nginx_version
        }
      }
    }

    sync_policy {
      automated {
        prune       = true
        self_heal   = true
        allow_empty = false
      }
      retry {
        limit = "5"
        backoff {
          duration     = "30s"
          max_duration = "1m"
          factor       = "2"
        }
      }
    }


    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "forager-helm"
    }
  }
}
